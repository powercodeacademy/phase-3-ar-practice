class Continent < ActiveRecord::Base
  # https://guides.rubyonrails.org/association_basics.html#the-has-many-association
  has_many :countries

  # If #capitals works:
  #   - it will return an array of strings (capitals)
  #   - only capitals of associated countries will be returned
  # SETUP IN CONSOLE:
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Need a continent instance that has at least 1 associated country set to a variable
  #     Country.all (looking for `continent_id` suggestions)
  #     europe = Continent.find_by(name: "Europe") (set the variable)
  # VERIFY IT WORKS:
  #   - expecting #capitals to return an array of only the capitals of associated countries

  # describe "#capitals" do
  #   it "returns only capitals of associated countries" do
  #     europe = Continent.create(name: "Europe")
  #     france = Country.create(name: "France", capital: "France's capital", continent: europe)
  #     germany = Country.create(name: "Germany", capital: "Germany's capital", continent: europe)

  #     expect(europe.capitals).to eq(["France's Capital", "Germany's capital"])
  #   end
  # end

  def capitals
    # go through the associated `countries`
    # pluck all of their capitals (https://apidock.com/rails/ActiveRecord/Calculations/pluck)

    # countries.map(&:capital)

    # countries.map { |country| country.capital }

    # countries.map do |country|
    #  country.capital
    # end
    countries.pluck(:capital)
  end

  # if #highest_population works:
  #   - it returns an instance of a Country
  #   - the country returned has the highest population out of all associated countries
  # SETUP IN CONSOLE:
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Need to find or create a continent and set it to a variable
  #     europe = Continent.find(2)
  #   - Need at least 2 countries associated to that continent
  #     europe.countries.count
  # RUN THE TESTS (VERIFY):
  #   - Assuming a country called Germany has the highest population in Europe:
  #     expect `europe.highest_population` to return an instance of a Country with the name of "Germany"
  def highest_population
    # go through to the associated countries
    # find what the highest population is (https://api.rubyonrails.org/v6.1.4/classes/ActiveRecord/Calculations.html#method-i-maximum)
    # find and return the associated country whose population matches the highest (https://apidock.com/rails/v4.0.2/ActiveRecord/FinderMethods/find_by)
    max_population = countries.maximum(:population) # finding the value of the highest associated population
    countries.find_by(population: max_population) # find/return the associated country whose :population matches that value
  end

  # if #winners_circle_members is working:
  #   - returns an array of Country objects
  #   - each Country must have more than 50 olympic medals
  #   - each Country must belong_to the continent the method is being called on
  # SETUP
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Need a continent
  #     europe = Continent.find(2)
  #   - Need at least 2 countries associated with this continent: 1 with more than 50 olympic_medals, and 1 with fewer.
  #     europe.countries
  # VERIFY
  #   - Assuming europe has 5 countries: France, Italy, and Switzerland all have > 50 olympic_medals. Germany and Spain have < 50
  #     expect `europe.winners_circle_members` to return an array with the Country records for France, Italy, and Switzerland
  #     expect `europe.winners_circle_members` NOT TO return Germany or Spain
  def winners_circle_members
    # go through to the associated countries
    # filter and return all associated countries where #winners_circle? is true (olympic_medals > 50) (https://apidock.com/rails/ActiveRecord/QueryMethods/where)

    # countries.filter { |country| country.winners_circle? }

    countries.where("olympic_medals > '50'")
  end

  # if #total_medals is working:
  #   - Should return an integer
  #   - The return value should be the sum of all `olympic_medals` won by a given country
  # SETUP
  #   - Start a console session
  #     $ bundle exec rake console
  #   - Need a continent
  #     north_america = Continent.find(1)
  #   - Need at least 2 countries associated with this continent that have won `olympic_medals`
  #     north_america.countries
  # VERIFY
  #   - Assuming that north_america has 2 countries, 1 with 113 `olympic_medals` and 1 with 56 `olympic_medals`:
  #     expect(north_america.total_medals) to equal 169
  #   - Assuming that australia has 1 country, with 0 `olympic_medals`
  #     expect(australia.total_medals) to equal 0 (rather than throwing an error)
  def total_medals
    # go through to the associated countries
    # return an integer that is the sum of all `olympic_medals` for associated countries (https://api.rubyonrails.org/v4.1.0/classes/ActiveRecord/Calculations.html#method-i-sum)
    countries.sum(:olympic_medals)
  end
end