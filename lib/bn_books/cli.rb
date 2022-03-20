class BnBooks::CLI 
    def call
        puts "            Welcome To BNBooks CLI!!! "
        display_best_sellers
        menu
        
      end
    
      def display_best_sellers
        x = Scraper.new
        x.scrape_category
        x.category.each.with_index(1) do |index, category|
        puts "\n#{category}. #{index}"
        end
      end
    
      def menu
        input = nil
        while input != "exit"
        puts "\nPlease type Book # for more details, or type exit!"
        input = gets.strip.downcase
        if (input.to_i > 0) && (input.to_i <= 20)
          x = Scraper.new
          x.scrape_category
          x.scrape_book(x.category[input.to_i-1])
          Book.display_book_details
          choose_book
          break
        else input == "list"
            Scraper.clear
            display_best_sellers
          end
        end
      end
     
      def choose_book
         input = nil
         while input != "exit"
         puts "Enter book # to go to the web page or 'list' to get categories or 'exit'!"
         input = gets.strip
         if (input.to_i > 0) && (input.to_i < 20)
           system("open https://www.barnesandnoble.com/#{Book.all[input.to_i-1].url}")
           elsif
             input == "list"
               Scraper.clear
               display_best_sellers
               menu
               break
            end
          end
        end

end