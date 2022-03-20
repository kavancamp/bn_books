require_relative "bn_books/version"
require_relative "bn_books/cli"
require_relative "bn_books/scraper"
require_relative "bn_books/book"

require 'pry'
require 'nokogiri'
require 'bundler'
require 'open-uri'

module BnBooks
  class Error < StandardError; end
  # Your code goes here...
end


#environment