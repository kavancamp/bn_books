class BnBooks::Book
    @@all = []
    attr_accessor :title, :author, :url, 

    def initialize
        @title = title
        @author = author
        @url = url
       save
    end

    def self.all
        BnBooks::Scraper.scrape_book if @@all.empty?
        @@all
    end

    def save
        @all << self
    end

    def self.display_books
        puts "Books in this category :"
        Book.all.each_with_index(1) do |book, index|
          if book.title
            puts "#{index}- Title: #{book.title} Author: #{book.author} Url: #{book.url}"
            end
        end
    end
end