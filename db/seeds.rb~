# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Importing skus..."

CSV.foreach(Rails.root.join('db/products.csv'), headers: true, col_sep: "\t") do |row|
  Product.where(name: row[1]).first_or_create.update_attributes(name: row[1], sku: row[0], image: row[2])
end


puts "done"
