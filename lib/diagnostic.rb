require 'ostruct'
Response = OpenStruct.new

##
# For questions which ask for a response but do not provide a
# `Response.something =` assignment, write code that meets the requirements
# using idiomatic and conventional Ruby. Running the tests and carefully
# inspecting messages can help if you've named something incorrectly.
#
# For questions which **do** provide a `Response.something =` assignment, you
# should replace whatever is assigned with your answer. For example, if the
# answer to a question is the `true` boolean:
#
#   ```diff
#   - Response.wdi_is_awesome = nil
#   + Response.wdi_is_awesome = true
#   ```
##

##
# Create a Person class, with attributes name, age, and location. All three
# attributes should be defined when you instantiate a new Person. Name should be
# readable and writeable, age should only be readable, and location should only
# be writable.

##
class Person

  attr_accessor :name
  attr_reader :age
  attr_writer :location

  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end
end
##

##
# Instatiate a new Person object using arguments "Dave", 32, and "Ohio".
# Then, in the next line, change this Person's location property to
# "Somerville". Finally, assign the modified Person to `Response.dave` below.

## replace nil with your response, then continue your work on the next line
dave = Person.new("Dave", 32, "Ohio")
Response.location = "Somerville"

##

##
# Create another class called Developer that inherits from Person.
# Give it a new instance method called 'solve_problems',
# which returns the string "think think think".

##
class Developer < Person
  def solve_problems
    puts "think think think"
  end
end
##

##
# Study the code below before responding.
# Then, in a comment on the next line,

class Animal
  def initialize
    @sound = nil
  end

  def say_hello
    puts "I am a #{self.class.name}, and I go '#{@sound}'"
  end
end

class Cat < Animal
  def groom
    puts 'lick... lick...'
  end
end

class HouseCat < Cat
  def initialize
    @sound = 'meow'
  end
end

## What will be the output from calling `HouseCat.new.say_hello`?
# replace nil with your response
Response.housecat_noise = "I am a HouseCat, and I go 'meow'"



## Explain why this would be the output, based on the method lookup chain.
# We are creating a new instance of a class HouseCat that inherits from Cat class that inherits from Animal class. Then we are creating a new instance method (say_hello) on the same class (HouseCat). {self.class.name} will return class that we are invoking our instance method on,  and @sound is initialized as "meow" on the same class.
# I  hope this makes sense.
##

##
# Define a new class, 'Lion', which (a) inherits from 'Cat',
# (b) uses the 'Carnivorous' module below as a mixin, and
# (c) adds a new method called `roar`, which prints out "ROAR!"

module Carnivorous
  def can_eat_meat?
    true
  end

  def eat_meat(food)
    if food.class == 'Animal'
      puts "NOM NOM NOM. #{food.class} is delicious"
    else
      puts 'Yuck!'
    end
  end
end

##
class Lion < Cat
  include Carnivorous

  def roar
    puts "ROAR"
  end
end
##

# #
# What are some of the advantages of using composition (i.e. mixins)
# over using direct inheritance?

##
# If we want to have same methods that we want to use in mulitple classes.
##

##
# Fix the 'ComboAttack' class below so that calling
# `ComboAttack.new.punch.move('left').kick.damage` doesn't cause an error.
#
# Then, create a new class method called "get_possible_moves",
# which returns the string "kick, move, punch"

class ComboAttack
  attr_reader :moves, :damage

  def initialize
    @moves = []
    @damage = 0
  end

  def punch
    @moves << 'punch'
    @damage += 5
    @damage *= multiplier
    self
  end

  def move(direction)
    @moves << "move #{direction}"
    self
  end

  def kick
    @moves << 'kick'
    @damage += 10
    @damage *= multiplier
    self
  end

  def get_possible_moves
    puts "kick, move, punch"
  end

  private
  def multiplier
    case (moves)
    when ['punch', 'move left', 'kick']
      1.5
    when ['kick', 'punch', 'up']
      2
    else
      1
    end
  end
end
