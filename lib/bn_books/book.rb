class BnBooks::Book
    attr_accessor :title, :books, :author, :price, :url

    @@all = []
  
    def initialize(title, author, price, url)
      @title = title
      @author = author
      @price = price
      @url = url
    
      save
    end
  
    def self.all
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