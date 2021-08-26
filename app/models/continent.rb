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


end