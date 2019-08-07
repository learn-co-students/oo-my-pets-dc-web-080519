require 'pry'

class Owner

  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end 

  def self.all
    return @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    name = Cat.new(name, self)  
  end

  def buy_dog(name)
    name = Dog.new(name, self)  
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def pets
    dogs + cats
  end

  def sell_pets
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
  "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end