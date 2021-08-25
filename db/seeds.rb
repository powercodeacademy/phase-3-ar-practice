# This will delete any existing rows from the Continent and Country tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting country/continent data..."
Country.destroy_all
Continent.destroy_all

puts "Creating continents..."

puts "Creating countries..."

puts "Seeding done!"