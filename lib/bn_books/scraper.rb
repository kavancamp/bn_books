class Scraper

  @@all = []

  def title 
    @@all
  end

  def scrape_best_sellers
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    title = doc.css("div.product-info-view")
    title.each do  |title|
      @@all << title.css("h3 a").text.strip
    end
    @@all
  end


  def scrape_book(input)
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
      
  doc.css("div.product-info-view").each do |book|

      title = book.css("h3 a").text.strip
      author = book.css("div.product-shelf-author").text.strip
      price = book.css("a.current.link").text
      #release_date = book.css("")
      url = book.css("a").attr("href").text
     Book.new(title, author, price, url)

      end
    end

  def self.clear
    @@all = []
  end
end




