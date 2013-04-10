require 'factory_girl'

FactoryGirl.define do
 factory :user do 
  sequence(:email) {|n| "email#{n}@factory.com" }
  sequence(:name){|n| "user name #{n}"}
  admin 'false'
  password 'auserpass'             
  admin_only 'false'   
  meal        
 end
end 
