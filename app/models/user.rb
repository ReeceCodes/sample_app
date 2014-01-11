class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy #this deletes records when deleting a user, if you wanted to simply deactivate instead of delete needs changing
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates(:name, presence:true, length: { maximum: 50})
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence:true, format: { with: email_regex }, uniqueness: { case_sensitive: false })
	has_secure_password
	validates :password, length: {minimum: 6 }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	def feed
		Micropost.where("user_id = ?", id) # ? mark escapes id param so no sql injection
	end
	
	
	private 
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
	
end
