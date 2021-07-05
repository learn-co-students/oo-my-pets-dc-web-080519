require 'pry'

class Owner
  @@all = []
  attr_reader :name, :species, :say_species
 
  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count  
    self.all.count
  end

  def self.reset_all
      # @@all = []
      # above will pass tests, but not best practice b/c it's directly changing another class method
    self.all.clear
    # this will instead run a method on @@all method instead of reset/changing it -- less likely to break it -- gives you flexibiliity if you change something about @@all later

  end

  def cats
    Cat.all.select do |item|      
      item.owner == self
    end
  end

  def dogs
    Dog.all.select do |pup|
      pup.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    my_pets = self.dogs + self.cats
    my_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end    
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end
end