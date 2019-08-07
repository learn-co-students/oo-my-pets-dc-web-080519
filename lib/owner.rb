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
      item.owner.name == self.name
    end
  end
  
  def dogs
    Dog.all.select do |pup|
      pup.owner == self
    end
  end



  #know about pets

  #buy pets



end