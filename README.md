# Continents and Countries

For this assignment, we'll be working with continents and countries on Earth.

We have two models: `Continent` and `Country`.

A `Continent` has many `Countries`, and a `Country` belongs to one `Continent`.

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

## Relationship

- What associations will this need?
- (i.e. `has_many`, `has_many through`, and `belongs_to`)

## Deliverables

Write the following migrations and methods in the
classes in the files provided. Feel free to build
out any helper methods if needed.

Deliverables use the notation `#` for instance
methods, and `.` for class methods.

Remember: Active Record give your classes access
to a lot of methods already! Keep in mind what
methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

## Migrations

The starter code has model files for the initial
`Continent` and `Country` models.

Your first job is to create and run migrations
for the following tables:
- `Continents` should have a name(string). (DONE)
- `Countries` should have a name(string),
capital(string), population(integer),
olympic_medals(Integer) and belong_to
a continent(integer)

### Continents Table

| Column | Type   |
| ------ | ------ |
| name   | String |

### Countries Table

| Column              | Type    |
| ------------------- | ------- |
| name                | String  |
| capital             | String  |
| population          | Integer |
| olympic_medals      | Integer |
| continent_id        | Integer |


After creating the `continents` and `countries`
tables using migrations, use the `seeds.rb` file
to create instances of your `Continent` and
`Country` classes so you can test your code.

### Object Relationship Methods

Use Active Record association macros and
Active Record query methods where
appropriate (i.e. `has_many` and `belongs_to`).

## Country

- `Country#continent` returns the instance of
`continent` associated with this country - DONE

- `Country#winners_circle?` will return `true`
if the country has more than 50 `olympic_medals`,
and `false` if the country has less than 50. - DONE

- `Country.top_10_medalists` will return an array
of the 10 countries that won the most olympic medals. - DONE

#### Continent

- `Continent#countries` returns all of the
countries associated with this continent - DONE

- `Continent#capitals` returns an array of
capitals from the countries associated
with this continent

- `Continent#highest_population` returns the
country associated with this continent
that has the highest population count.

- `Continent#winners_circle_members` returns
all `countries` associated with this continent
that have more than 50 `olympic_medals`.

- `Continent#total_medals` returns the total
amount of `olympic_medals` that were
won by its associated `countries`.