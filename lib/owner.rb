class Owner


  @@all = []
  attr_reader :name, :species
  
  
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |kitty|
      kitty.owner == self
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
    my_dogs = self.dogs
    my_dogs.each do |dog|
      dog.mood = "happy"
      
    end
  end

    def feed_cats
      self.cats.each do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets
      my_pets = self.cats + self.dogs
      my_pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
















end