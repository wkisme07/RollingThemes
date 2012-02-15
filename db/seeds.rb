# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default admin
unless User.all.map(&:type).include?('Admin')
  puts "Create default admin account ..."
  Admin.create(
    :first_name             => "Admin",
    :last_name              => "Kuya",
    :email                  => 'admin@kuyainside.com',
    :password               => 'kuY41nsiD3G000',
    :password_confirmation  => 'kuY41nsiD3G000'
  )
end

# Create Categories
if Category.all.blank?
  puts "Create Categories ..."
  Category.create([
    {:name => 'Themes'},
    {:name => 'Design'},
    {:name => 'Technology'},
    {:name => 'Style'}
  ])
end

# Create Tags
if Tag.all.blank?
  puts "Create Tags ..."
  Tag.create([
    {:name => 'Photoshop'},
    {:name => 'CSS 3'},
    {:name => 'HTML 5'}
  ])
end
