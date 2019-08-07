class Cat
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []
  # code goes here
  def initialize (name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end

  def self.all
    return @@all
  end

end