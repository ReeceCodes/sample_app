FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}"}
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "Tested"
		password_confirmation "Tested"
		
		factory :admin do
			admin true
		end
		
	end
	
	factory :micropost do
		content "Filler content"
		user
	end
	
end