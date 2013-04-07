class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_access

  def show
    @user = User.find(params[:id])
  end

 private 

  def authenticate_access
   user = User.find(params[:id])
   unless current_user == user 
    redirect_to root_path, :alert => "You are not permitted to access this page"
   end
  end

end
