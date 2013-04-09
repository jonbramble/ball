class MealsController < ApplicationController
 before_filter :authenticate_user!
 before_filter :authenticate_access

 def edit
  @meal = current_user.meal

  respond_to do |format|
		format.html
  end

 end

 def update
  @meal = Meal.find params[:id]
  @meal.chosen = true

   if @meal.update_attributes(meal_params)
      UserMailer.update_meal(current_user).deliver
      redirect_to user_path(current_user), :notice => 'Your meal options were successfully updated.'
   else
      render :action => 'edit'
   end
 end


 private
 
 def meal_params
  params.require(:meal).permit(:vegetarian,:wine, :coffee, :allergies)
 end

 def authenticate_access
  user = User.find(params[:user_id])
  unless current_user == user 
   redirect_to root_path, :alert => "You are not permitted to access this page"
  end
 end
 
end
