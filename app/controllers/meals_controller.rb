class MealsController < ApplicationController
 before_filter :authenticate_user!

 def edit
  @meal = current_user.meal

  respond_to do |format|
		format.html
  end

 end

 def update
  @meal = Meal.find params[:id]

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
 

end
