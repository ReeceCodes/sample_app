class RelationshipsController < ApplicationController
	before_action :signed_in_user
	
	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		respond_to do |f|
			f.html {redirect_to @user} #if it's an html request do this
			f.js #if js request do this (don't redirect but still respond for the ajax, i think)
		end
	end
	
	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |f|
			f.html {redirect_to @user}
			f.js
		end
	end
	
	
end