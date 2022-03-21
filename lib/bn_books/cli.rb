class CLI 

    def call
        puts "       Welcome To B & N Best Sellers CLI!!! "
        puts "                  ***********"
        list_best_sellers
        menu
    end
    
    def list_best_sellers
        x = Scraper.new
        x.scrape_best_sellers
        x.title.each_with_index do |title,index|
        puts "#{index + 1}.#{title}"
        puts "             "
        end
    end

    def menu
        input = nil
        while input != "exit"
        puts "***********************************************"
        puts "Please enter the number of the book you would like more information on, else enter 'list' or exit !"
        puts "***********************************************"
        puts "\n"
        input = gets.strip.downcase
           if (input.to_i > 0) && (input.to_i <= 20)
            x = Scraper.new
            x.scrape_best_sellers
            x.scrape_book(x.title[input.to_i-1])
            Book.display_book_details
            book_link
            break
           elsif input == 'list'
        list_best_sellers
    else 
        puts "\n Invalid Entry, Please try again"
    end
end
end
    def book_link
        input = nil
        while input != "exit"
        puts "\nEnter book number to go to the web page or 'list' to get categories or 'exit'!"
        input = gets.strip
        if (input.to_i > 0) && (input.to_i < 20)
        system("open https://www.barnesandnoble.com/{Book.all[input.to_i-1].url}")
        elsif
            input == "list"
        Scraper.clear
            best_sellers
            menu
            break
        else
            break
        end
        end
    end

end