# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Importing exercises..."

CSV.foreach(Rails.root.join('db/exercises.csv'), headers: true, col_sep: "\t") do |row|
  Exercise.where(name: row[0]).first_or_create.update_attributes(name: row[0])
end


puts "done"
