module ApplicationHelper

	def full_title(page_title)
		base_title = "RoR Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	RSpec::Matchers.define :have_error_message do |message|
		match do |page|
			expect(page).to have_selector('div.alert.alert-error', text:message)
		end
	end

end
