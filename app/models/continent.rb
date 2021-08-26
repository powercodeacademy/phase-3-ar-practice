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
  #   - expect `europe.highest_population` to return an instance of a Country with the name of "Germany"
  def highest_population
    # go through to the associated countries
    # find what the highest population is (https://api.rubyonrails.org/v6.1.4/classes/ActiveRecord/Calculations.html#method-i-maximum)
    # find and return the associated country whose population matches the highest (https://apidock.com/rails/v4.0.2/ActiveRecord/FinderMethods/find_by)
    max_population = countries.maximum(:population) # finding the value of the highest associated population
    countries.find_by(population: max_population) # find/return the associated country whose :population matches that value
  end

  def winners_circle_members

  end

  def total_medals

  end
end