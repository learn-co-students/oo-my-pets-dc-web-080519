require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    return @@all
  end

  def self.count
    return self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
    end  
  end

  def dogs
    Dog.all.find_all do |dog|
      dog.owner == self
    end  
  end

  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
end

def list_pets
  return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end


end