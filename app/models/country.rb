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
end