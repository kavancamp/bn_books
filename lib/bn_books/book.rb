class BnBooks::Book 
    attr_accessor :title, :books, :author, :price, :url
   #read and write accessors
    @@all = []

    #A variable prefixed with @ is an instance variable
    #@@ is a Class variable or static variable it can be inherited. 
    #This means that if you create a subclass of that class, it will inherit the variable
  
    def initialize(title, author, price, url) #set values for objects
      @title = title    #instance variables @
      @author = author
      @price = price
      @url = url
     
      save
    end
  
    def self.all #class method for reading data in variable @@all
      BnBooks::Scraper.scrape_best_sellers if @@all.empty?
      @@all
    end

    def save 
      @@all << self
    end

    def self.clear
      @@all =[]
    end

end