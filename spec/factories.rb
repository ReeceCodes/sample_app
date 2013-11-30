FactoryGirl.define do
	factory :user do
		name "Test User"
		email "Test@test.com"
		password "Tested"
		password_confirmation "Tested"
	end
end