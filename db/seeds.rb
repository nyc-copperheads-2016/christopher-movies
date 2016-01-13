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
months = hash["cast"].map {|movie| movie["release_date"][0,7] }.uniq
root = Folder.create!(name: 'movies')
years.each{ |y| root.children.create!(name: y.to_s) }
months.each do |m|
  year = m[0,4]
  parent = Folder.find_by(name: year.to_s)
  parent.children.create!(name:m)
end
hash["cast"].each do |movie|
  parent = Folder.find_by(name: movie["release_date"][0,7])
  title = parent.children.create!(name: movie["title"])
  title.children.create!(name: movie["character"])
end