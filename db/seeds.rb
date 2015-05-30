# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# seed buat ADMIN
User.create!(:email=>"testing@hosting.natanetwork.com", :password=>"1234567", :password_confirmation=>"1234567", :email_recovery=>"testing@hosting.natanetwork.com", :role=>"Admin", :admin_approval=>true)

User.create!(:email=>"kaskus@yahoo.com", :password=>"1234567", :password_confirmation=>"1234567", :email_recovery=>"kaskus@yahoo.com", :role=>"SuperAdmin", :admin_approval=>true)