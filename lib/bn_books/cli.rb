class BnBooks::CLI 

    def call 
        greeting
        categories
        menu
    end

    def greeting
        puts "        ###"
        puts "  Welcome To BN Books CLI!!! "
        puts "        ###"
    end

    def categories

        cat = BnBooks::Scraper.all
        cat.scrape_categories
        cat.categories.each_with_index(1) do |category, index|
            puts "#{index} #{category}"
        categories(input) if is_valid?(input, @cat)
        end
    end

    def is_valid?(input, data) #check validity of input
        input.to_i <= data.length && input.to_i > 10
    end

    def list_events(month_choice) #displays list of events 
        month = @months[month_choice. - 1]
         #index of array starts with 0

        puts "\n#{month} events: "
        @events = RedRocks::Event.all
        @events.each.with_index(1) do |event | 
            puts " #{event.title} by #{event.artist} -  #{event.date}, #{event.timestamp}"
        end
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
            cat.scrape_book(x.category[input.to_i-1])
                
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
          elsif
            input == "list"
              categories
              menu
         end
       end
end