# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

seed_file = File.join(Rails.root, 'db', 'users.yml')
config = YAML::load_file(seed_file)

config['users'].each do |user|

 u = User.new(
  :email => user['email'], :password => user['password'], :admin => user['admin']
 )
 u.save!

end
