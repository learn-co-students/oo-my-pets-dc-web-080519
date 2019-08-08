require 'pry'

class Owner
  #class methods:
    #.all - return all instances of owner that have been created
  @@all = []
    #.count - return # of owners created
  
    #.reset_all resets owners
  
    attr_reader :name, :species, :say_species

  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.count  
    return self.all.count
  end

  def self.reset_all
    @@all = []
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

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end


  def sell_pets
    self.dogs.each do |d|     d.mood = "nervous"
      d.owner = nil

    end
    
    self.cats.each do |c|     c.mood = "nervous"   
      c.owner = nil
    end
    
  end


  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end




end