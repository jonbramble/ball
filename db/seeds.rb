# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

seed_file = File.join(Rails.root, 'db', 'users.yml')
config = YAML::load(ERB.new(File.read(seed_file)).result)

config['users'].each do |user|
 
 raw_parameters = {:email => user['email'], :password => user['password'], :admin => user['admin'], :name =>user['name']}
 parameters = ActionController::Parameters.new(raw_parameters)
 user = User.create(parameters.permit(:email,:password,:admin,:name))
 user.create_meal

end
