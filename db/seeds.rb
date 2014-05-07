# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all

categories = Category.create([{link:"Astronomy", launch_image:"astronomy"},
  {link:"Biology",launch_image:"biology"},
  {link:"Chemistry",launch_image:"chemistry"},
  {link:"Engineering",launch_image:"engineering"},
  {link:"Physics",launch_image:"physics"},
  {link:"Robotics",launch_image:"robotics"}])