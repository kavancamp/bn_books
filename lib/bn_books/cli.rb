class BnBooks::CLI 
    def call
        puts "                         Welcome To BNBooks CLI!!! "
        category_list
        print_books
        menu
       
      end
    
      def category_list
        x = Scraper.new
        x.scrape_category
        x.category.each.with_index(1) do |index, category|
        puts "\n#{category}. #{index}"
        end
      end
    
      def menu
        input = nil
        while input != "exit"
        puts "\nPlease type Book # or type exit!"
        input = gets.strip.downcase
        if (input.to_i > 0) && (input.to_i <= 20)
          Book.clear
          Scraper.clear
          x = Scraper.new
          x.scrape_category
          x.scrape_book(x.category[input.to_i-1])
          Book.print_books
          choose_book
          break
        elsif input == "list"
          Scraper.clear
          category_list
        else
    
          end
        end
      end
    
      def print_books
        puts "Here is your selected book:"
        puts ""
      input =  BnBooks::Book.find_by_index(input.to_i - 1)
          if book.title
    
            puts "#{index}- Title: #{book.title}"
    
            puts "    Author: #{book.author}"
    
            puts "     URL : #{book.url}"
            puts "------------------------"
          end
        end
      end

      def choose_book
         input = nil
         while input != "exit"
         puts "Select a book number to go to the web page or list to get categories or exit !"
         input = gets.strip
         if (input.to_i > 0) && (input.to_i < 20)
           system("open https://www.barnesandnoble.com/w/#{Book.all[input.to_i-1].url}")
           elsif
             input == "list"
               Scraper.clear
               category_list
               menu
               break
             else
               break
            end
          end
        end

    end