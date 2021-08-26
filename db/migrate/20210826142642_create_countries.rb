class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :capital
      t.integer :population
      t.integer :olympic_medals
      t.integer :continent_id # OR t.belongs_to :continent (https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)
    end
  end
end

# Command to create this migration:
# $ bundle exec rake db:create_migration NAME=create_countries

# Command to run the migration:
# $ bundle exec rake db:migrate

# Options for checking to see if the migration worked:
#   Check the schema file to see if the table's there
#   $ bundle exec rake db:migrate:status
#   $ bundle exec rake console
#     - then try to create a new country OR run Country.column_names

# Verifying through the console that the has_many/belongs_to relationship works
#  (Ask yourself if the relationship is working, what will we be able to do?)
#   - If we run #continent on a `country`, it should return the Continent
#     instance that it belongs to (verifying belongs_to)
#   - If we run #countries on a `continent`, it should return an array of
#     Country instances that belong to it (verifying has_many)
# SETUP IN CONSOLE:
#   - Open a console session
#     $ bundle exec rake console
#   - Create a continent
#     europe = Continent.create(name: "Europe")
#   - Create 2 countries and associate them to the continent
#     france = Country.create(name: "France", capital: "Paris", population: 19000000, olympic_medals: 52, continent: europe)
#     germany = Country.create(name: "Germany", capital: "Frankfurt", population: 22000000, olympic_medals: 43, continent: europe)
# RUN THE TESTS (VERIFY IT WORKS):
#   - expecting `france.continent` to be europe
#   - expecting `europe.countries` to be an array including france and germany

# Canvas lesson:
# https://my.learn.co/courses/249/assignments/10606?module_item_id=23249
