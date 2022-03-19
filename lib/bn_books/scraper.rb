class BnBooks::Scraper 

@@all = []
def category
    @@all.delete_if {|cat| (cat.include? " ") || (cat.include? "/") || (cat.include? "Postmodernism") || (cat.include? "Religion") || (cat.include? "Technology") || (cat.include? "Environment") || (cat.include? "Communications")}
end
def scrape_categories
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/h/books/browse"))
    category = doc.css("div.html-embed-container")
    category.each do |name|
      @@all << name.css("h3").text
    end
    @@all.shift

  end


end




