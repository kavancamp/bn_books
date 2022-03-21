class BnBooks::CLI 

    def call
        puts "       Welcome To B & N Best Sellers CLI!!! "
        puts "                  ***********"
        puts "\n"
        get_best_sellers
        list_best_sellers
        get_customer_choice
        book_link
    end
    def get_best_sellers
        @books = BnBooks::Book.all
    end

    def list_best_sellers #get 
        puts "***********************************************"
        puts "Enter the number of the book you would like more information on, else enter 'list' or exit !"
        puts "***********************************************"
        puts "\n"
    @books.each.with_index(1) do |book, index| 
        #iterate 
        puts "#{index}. #{book.title}"
        puts "             "
        end 
    end

    def get_customer_choice
        chosen_book = gets.strip.to_i #get book choice. .strip method-Remove leading and trailing whitespace
        display_book_details(chosen_book) if is_valid?(chosen_book, @books)
    end

    def is_valid?(input, data)#check validity of input
       if input.to_i <= data.length && input.to_i > 0
    end

    def display_book_details(chosen_book)
        book = @books[chosen_book - 1]
        books = 
        puts "More info on selected title :"
                puts "Title: #{book.title}"
                puts "Author: #{book.author}"
                puts "Price: #{book.price}"
                puts "URL : #{book.url}"
                puts "------------------------" 
    end

    def book_link
        input = nil
       while input != "exit"
        puts "\nEnter book number to go to the web page or 'list' to get categories or 'exit'!"
        input = gets.strip
        if (input.to_i > 0) && (input.to_i < 100)
        system("open https://www.barnesandnoble.com/#{BnBooks::Book.all[input.to_i-1].url}")
        elsif
            input == "list"
        BnBooks::Scraper.clear
           list_best_sellers
            break
        elsif 
         puts   "\nInvalid Entry, Enter book number to go to view more information on a title, 'list' to view list again, or 'exit'!" 
    else 
        input == "exit"
        puts " "
        puts "\nHave a nice day!!!!"
        break
        BnBooks::Scraper.clear 
        end
       end
    end

end