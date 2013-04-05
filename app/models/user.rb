class User < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  has_one :meal 
  #after_create :add_meal 	#here because we have no user controller

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,  :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :admin
  # attr_accessible :title, :body

 
  #private 

  #def add_meal
   #self.create_meal
  #end
  
end
