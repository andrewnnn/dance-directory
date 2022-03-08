# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# STUDIOS
csv_text = File.read(Rails.root.join('lib', 'seeds', 'studios.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Studio.new
  t.id = row['id']
  t.name = row['name']
  t.description = row['description']
  t.city = row['city']
  t.address = row['address']
  t.save
  puts "#{t.name}, #{t.city} saved"
end

puts "There are now #{Studio.count} rows in the studios table"

# STYLES
csv_text = File.read(Rails.root.join('lib', 'seeds', 'styles.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Style.new
  t.id = row['id']
  t.name = row['name']
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Style.count} rows in the styles table"

# STUDIOS STYLES
csv_text = File.read(Rails.root.join('lib', 'seeds', 'studios_styles.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  studio = Studio.find(row['studio_id'])
  style = Style.find(row['style_id'])
  studio.styles << style
end

# REVIEWS
csv_text = File.read(Rails.root.join('lib', 'seeds', 'reviews.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Review.new
  t.id = row['id']
  t.stars = row['stars']
  t.detail = row['detail']
  t.studio_id = row['studio_id']
  t.save
end

puts "There are now #{Review.count} rows in the reviews table"