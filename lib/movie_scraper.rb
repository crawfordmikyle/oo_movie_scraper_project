require "movie_scraper/version"
require_relative "scraper"
class Movie_Scraper
  def self.movie_list
  	puts Scraper.data_arr
  end

  def movie_info
  	puts "lorem"
  end

end