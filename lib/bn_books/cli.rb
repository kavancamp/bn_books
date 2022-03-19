class BnBooks::CLI 

    def call 
        greeting

        categories
        #menu
    end

    def greeting
        puts "        ### "
        puts "  Welcome To BN Books!!! "
        puts "        ### "
    end

    def categories

        @cat = BnBooks::Scraper.all
        cat.scrape_category
        cat.category.each_with_index(1) do |category, index|
            puts "#{index} #{category}"
        categories(input) if is_valid?(input, @cat)
        end
    end

    def is_valid?(input, data) #check validity of input
        input.to_i <= data.length && input.to_i > 10
    end

    def menu
        while input != "exit"

        puts "/nEnter a number, 'list' to display categories, or 'exit' "

        input = gets.strip.downcase
        if (input.to_i > 0) && (input.to_i < 10)
       
    end

end