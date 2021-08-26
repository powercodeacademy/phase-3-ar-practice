class Continent < ActiveRecord::Base
  # https://guides.rubyonrails.org/association_basics.html#the-has-many-association
  has_many :countries
end