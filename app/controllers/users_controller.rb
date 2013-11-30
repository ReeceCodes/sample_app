class UsersController < ApplicationController
  def show
	@user = User.find(params[:id])
  end
  
  def new
	@user = User.new
  end
  
  def create
	@user = User.new(uparams)
	if @user.save
	flash[:success] = "Welcome to the Sample App"
		redirect_to @user
	else
		render 'new'
	end
  end
  
  private 
	def uparams
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
