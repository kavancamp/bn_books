class BnBooks::Book
    @@all = []
    attr_accessor :title, :author, :url, :price

    def initialize
        @title = title
        @author = author
        @url = url
        @price = price
       save

    end

    def self.all
        BnBooks::Scraper.scrape_book if @@all.empty?
        @@all
    end

    def save
        @all << self
    end
end