class Country < ActiveRecord::Base
  # https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
  belongs_to :continent

  # If #winners_circle? is working:
  #   - it will return `true` if a country has more than 50 `olympic_medals`
  #   - it will return `false` if a country has less than 50 `olympic_medals`.
  # SETUP IN CONSOLE:
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Verify that we have at least 2 countries: one with > 50 `olympic_medals`, one with < 50 `olympic_medals`)
  #     Country.all
  #   - Once we have two of them, set them to variables
  #     france = Country.find_by(name: "France")
  #     germany = Country.find_by(name: "Germany")
  # RUN THE TESTS (VERIFY IT WORKED):
  #   - expect `france.winners_circle?` to be true
  #   - expect `germany.winners_circle?` to be false
  def winners_circle?
    olympic_medals > 50
  end

  # If .top_10_medalists is working:
  #   - it will return an array with `olympic_medals` in descending order
  #   - it will return an array of 10 countries at maximum
  # SETUP:
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Make sure there are at least 11 countries
  #     Country.count (verify the count)
  #     (Create more countries if needed)
  # RUN THE TESTS (VERIFY IT WORKED):
  #   - expect `Country.top_10_medalists` to return only 10 countries in descending
  #     order based on `olympic_medals`
  #   - expect `Country.top_10_medalists` NOT TO return the country with the least amount
  #     of `olympic_medals`
  def self.top_10_medalists
    # order by olympic medals (https://apidock.com/rails/ActiveRecord/QueryMethods/order)
    # grab the top 10 (https://apidock.com/rails/ActiveRecord/QueryMethods/limit)
    order(olympic_medals: :desc).limit(10)
  end
end
