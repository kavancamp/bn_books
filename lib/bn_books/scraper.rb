class BnBooks::Scraper

  def self.scrape_best_sellers
    page = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    books = page.css("div.product-info-view")
    books.each do  |data|
      title = data.css("h3 a").text.strip.chomp
      author = data.css("div.product-shelf-author").text.strip
      price = data.css("a.current.link").text.strip
      url = data.css("a").attr("href").text
      BnBooks::Book.new(title, author, price, url)
      
    end
  end
  def self.clear
    @@all = []
  end

end




