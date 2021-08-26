class Country < ActiveRecord::Base
  # https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
  belongs_to :continent
end