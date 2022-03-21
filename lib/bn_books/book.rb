class Book
    attr_accessor :title, :author, :url, :price

    @@all = []
  
    def initialize
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_index(index)
      @all[index]
    end

  def self.clear
    @@all =[]
  end

  def self.display_book_details
    puts "More info on selected title :"
    puts ""
      Book.all.each.with_index(1) do |book, index |
        if book.title
            puts "#{index}- Title: #{book.title}"
            puts " Author: #{book.author}"
            puts " URL : #{book.url}"
            puts " Price: #{book.price}"
            puts "------------------------"
          end
        end
      end



end