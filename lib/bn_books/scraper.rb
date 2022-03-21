class Scraper

  @@all = []

  def best
    @@all
  end

  def scrape_best_sellers
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    best = doc.css("div.product-info-view")
    best.each do  |name|
      @@all << name.css("h3 a").text.strip
    end
   
  end


  def scrape_book(input)
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
      
    book = doc.css("div.product-info-view")
    book.each do |info|
      story = Book.new
      story.title = info.css("h3 a").text.strip
      story.author = info.css("div.product-shelf-author").text.strip
      story.price = info.css("a.current.link").text
      #release_date = book.css("")
      story.url = info.css("a").attr("href").text
      end
    end

  def self.clear
    @@all = []
  end
end




