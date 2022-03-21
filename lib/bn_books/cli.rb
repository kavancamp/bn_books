class BnBooks::CLI 

    def call
        greeting
        get_best_sellers
        list_best_sellers
        get_customer_choice
        book_link
    end
    def greeting 
        puts "                          3Welcome To B & N Best Sellers CLI!!! "
        puts "\n"
    end
    def get_best_sellers
        @books = BnBooks::Book.all
    end

    def list_best_sellers #get 
        puts "              ***********************************************"
        puts "Enter the number of the book you would like more information on, enter 'list' or exit !"
        puts "              ***********************************************"
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
     input.to_i <= data.length && input.to_i > 0
    end

    def display_book_details(chosen_book)
        book = @books[chosen_book - 1]
        books = 
        puts "\n                   More info on selected title:"
                puts "                  Title:  #{book.title}"
                puts "                  Author: #{book.author}"
                puts "                  Price:  #{book.price}"
                puts "                  URL :   #{book.url}"
                puts " " 
    end

    def book_link
        input = nil
       while input != "exit"
        puts "\nEnter book number to visit Barnes and Noble, 'list' to view the list again, or 'exit'!"
        puts "\n                    ------------------------" 
        input = gets.strip
        if (input.to_i > 0) && (input.to_i < 100)
        system("open https://www.barnesandnoble.com/#{BnBooks::Book.all[input.to_i-1].url}")
     BnBooks::Scraper.clear

    elsif 
        input == "exit"
        puts " "
        puts "\n                   Have a nice day!!!!"
        puts " "
        BnBooks::Scraper.clear 
    elsif input == "list"
    BnBooks::Scraper.clear
       list_best_sellers
    else
    puts "\n                    ------------------------" 
    puts "                  I'm sorry, I do not understand"
    
    
        end
       end
    end

end