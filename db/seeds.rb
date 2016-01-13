# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
content = File.read(Rails.root.join('db', 'c_lee.json'))
hash = JSON.parse(content)
years = hash["cast"].map {|movie| movie["release_date"][0,4] }.uniq
root = Folder.create!(name: 'movies')
years.each{ |y| root.children.create!(name: y.to_s) }
hash["cast"].each do |movie|
  parent = Folder.find_by(name: movie["release_date"][0,4])
  title = parent.children.create!(name: movie["title"])
  title.children.create!(name: movie["character"])
end