class Admin::UsersController < ApplicationController
  layout "admin"

  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  def index
	@users = User.where(:admin_only => :false)
        @admin_users = User.where(:admin => :true)
	respond_to do |format|
		format.html
	end
  end

  def show
       @user = User.find(params[:id])
       @meal = @user.meal
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
	@user = User.find(params[:id])

         if @user.update_attributes(user_params)
            redirect_to admin_users_path, :notice => 'You have sucessfully added a guest.'
        else
          render :action => 'edit'
        end

  end

  def destroy
	@user = User.find(params[:id])
	@user.destroy

    	respond_to do |format|
      	  format.html { redirect_to admin_users_path }
    	end
  end

  def summary
	@users = User.includes(:meal).where(:admin_only => :false)

	@veg_count = Meal.where(:vegetarian => :true).count
	@guest_count = User.where(:admin_only => :false).count

        @chosen_count = User.where(:chosen => :true).count
        @coffee_count = Meal.where(:coffee => :true).count

	respond_to do |format|
      	  format.html
          format.pdf do
            pdf = SummaryFormPdf.new(@users, @veg_count, @guest_count, @coffee_count)
            send_data pdf.render, filename: "summary.pdf", type: "application/pdf", dispostion: "inline"
          end

          format.ods do
	   ods = SummaryFormOds.new()
	   ods.create_sheet(@users, @veg_count, @guest_count, @coffee_count)
	   file = "#{Rails.root}/tmp/summary_#{Process.pid}";
	   if ods.write_file file
	     send_file file,  filename: "my-spreadsheet.ods", type: "application/ods", dispostion: "inline"
	   end
          end

    	end

  end

  private

  def authenticate_admin!
   unless current_user.admin
	redirect_to root_path, :alert => "You are not an admin go away"
   end
  end

  def user_params
       params.require(:user).permit(:name,:email,:admin, :admin_only)
  end
end
