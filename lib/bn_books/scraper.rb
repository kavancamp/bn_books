class Scraper 
  @@all = []
  def category
    @@all
  end

  def scrape_category
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    category = doc.css("div.product-info-view")
    category.each do  |title|
      @@all << title.css("h3 a").text.strip
    end
    @@all

  end


  def scrape_book(input)
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
        book = doc.css("div.product-info-view")
        book.each do |data|
          obj = Book.new
          obj.title = data.css("h3 a").text.strip
          obj.author = data.css("div.product-shelf-author").text.strip
          obj.url = data.css("a").attr("href").text
        end
      end

    def self.clear
      @@all = []
    end
end




