class BnBooks::CLI 

    def call 
        greeting
        categories
        menu
    end

    def greeting
        puts "  ** Welcome To BN Books CLI **"
    end

    def categories
        cat = BnBooks::Scraper.new
        cat.scrape_categories
        cat.category.each_with_index(1) do |category, index|
            puts "#{index} #{category}"
        category(input) if is_valid?(input, @cat)
        end
    end

    def is_valid?(input, data) #check validity of input
        input.to_i <= data.length && input.to_i > 10
    end

    def menu
    
        input = nil
        while input != "exit"
        puts "/nEnter a number, 'list' to display categories, or 'exit' "
        input = gets.strip.downcase
          #Capture input using gets
            #.strip method to remove any new lines or leading and trailing whitespace
        if input.to_i > 0 && input.to_1 < 3
            cat.scrape_categories
            cat.scrape_book(cat.category[input.to_i-1])
                
                Book.display_books
                book_choice
            elsif input == 'exit'
                puts 'goodbye'
            elsif input == 'list'
                list_events
            else 
            puts "\n Invalid Entry, please enter 'list', 'exit', or enter the number of a book for more information on"
            end
        end
    end
    
    def book_choice
   
        input = nil
        while input != "exit"
        puts "Select a book number for further information, 'list' to get categories or 'exit' !"
        input = gets.strip.downcase
        if (input.to_i > 0) && (input.to_i < 10)
          system("open /https://www.barnesandnoble.com/h/books/browse#{Book.all[input.to_i-1].url}")
        else
            input == "list"
              categories
              menu
         end
       end
    end
end