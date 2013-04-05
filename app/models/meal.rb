class Meal < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :allergies, :coffee, :vegetarian, :wine
 
  belongs_to :user

  WINE = ["Red","White","No Preference"]  


  after_update :set_chosen

  def set_chosen
   user = User.find(self.user_id)
   user.chosen = true
   user.save
  end

end
