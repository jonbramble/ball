class Admin::UsersController < ApplicationController
  layout "admin"

  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  def index
	@users = User.find(:all)
	respond_to do |format|
		format.html
	end
  end

  def new
	@user = User.new
	respond_to do |format|
		format.html
	end

  end

  def edit
	@user = User.find(params[:id])
	respond_to do |format|
		format.html
	end

  end

  def create
    password = Devise.friendly_token.first(10)
    @user = User.new(user_params)

    @user.password = password

    @user.build_meal
     
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
	UserMailer.welcome_email(@user,password).deliver
      else
        format.html { render action: "new" }
      end
    end
	
  end

  def update
	# must to this
  end

  def destroy
	@user = User.find(params[:id])
	@user.destroy

    	respond_to do |format|
      	  format.html { redirect_to admin_users_path }
    	end
  end

  def summary
	@users = User.includes(:meal)

	@veg_count = Meal.where("vegetarian",true).count
	@user_count = User.count
	
	respond_to do |format|
      	  format.html
    	end

  end

  private

  def authenticate_admin!
   unless current_user.admin
	redirect_to root_path, :alert => "You are not an admin"
   end
  end

  def user_params
   params.require(:user).permit(:name,:email)
  end
end
