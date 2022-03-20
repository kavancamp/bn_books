class Book

attr_accessor :title, :author, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
  def self.clear
    @@all =[]
  end
  def self.find_by_index(index)
    @@all[index]
  end
  
end