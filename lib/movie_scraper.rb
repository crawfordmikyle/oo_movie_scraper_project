require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"

class Movie_scraper
	attr_accessor :main_data_hash
	def initialize
		system("clear")
		Main_methods.make_movies
		Main_methods.list_results
		Main_methods.movie_info
	end  
end
