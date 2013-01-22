class Admin::UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  def index
	@users = User.find(:all)
	respond_to do |format|
		format.html
	end
  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def authenticate_admin!
   unless current_user.admin
	redirect_to root_path, :alert => "You are not an admin"
   end
  end
end
