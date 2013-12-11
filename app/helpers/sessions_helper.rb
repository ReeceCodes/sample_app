module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token #cookies[:id] = {value:1, expires:24.hours.from_now.utc} using optional expiration, .permanent means 20.years.from_now
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end
	
	def current_user=(user)
		@current_user = user
	end	

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
	
end
