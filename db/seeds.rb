# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "#{File.dirname(__FILE__)}/../lib/import_csv_module.rb"
include ImportCsvModule

# seed buat SUPERADMIN
import_csv_kabupaten
User.create!(:email=>"superadmin@yahoo.com", :password=>"1234567", :password_confirmation=>"1234567", :email_recovery=>"hendranatas@yahoo.com", :role=>"SuperAdmin", :admin_approval=>true, :created_by => "SuperAdmin", :nama=>"SuperAdmin")