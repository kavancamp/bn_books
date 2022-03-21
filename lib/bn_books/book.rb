class Book
    attr_accessor :title, :author, :url, :price

    @@all = []
  
    def initialize(title, author, url, date)
      @title = title
      @aauthor = author
      @url = url
      @price = price
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_index(index)
      @@all[index]
    end

  def self.clear
    @@all =[]
  end

  def self.display_book_details
    puts "More info on selected title :"
    puts ""
      Book.all.each_with_index do |book,index|
          if title.title
            puts "#{index + 1}- Title: #{book.title}"
            puts " Author: #{book.author}"
            puts " URL : #{book.url}"
            puts " Price: #{book.price}"
            puts "------------------------"
          end
        end
      end



end