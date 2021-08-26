class CreateContinents < ActiveRecord::Migration[6.1]
  def change
    create_table :continents do |t|
      t.string :name
    end
  end
end

# Command to create this migration:
# $ bundle exec rake db:create_migration NAME=create_continents

# Command to run the migration:
# $ bundle exec rake db:migrate

# Options for checking to see if it worked:
#   Check the schema file to see if the table's there
#   $ bundle exec rake db:migrate:status
#   $ bundle exec rake console
#     - then try to create a new continent OR run Continent.column_names


# Canvas lesson:
# https://my.learn.co/courses/249/assignments/10606?module_item_id=23249

