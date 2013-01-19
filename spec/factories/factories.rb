require 'factory_girl'

FactoryGirl.define do
 factory :user do |f| 
  f.name 'testuser'
  f.email 'testuser@abc123.com'
  f.password 'auserpass'
 end
end 
