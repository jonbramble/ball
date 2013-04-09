class User < ActiveRecord::Base

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  include ActiveModel::ForbiddenAttributesProtection

  has_one :meal, :dependent => :destroy 


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,  :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :admin
  # attr_accessible :title, :body

end
