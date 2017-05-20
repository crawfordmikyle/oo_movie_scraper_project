require "movie_scraper/version"
require_relative "scraper"
require_relative "main_methods"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	def initialize
		system("clear")
		Main_methods.make_movies
		Main_methods.make_locations
		Main_methods.list_results
		Main_methods.movie_and_theater_info
	end  
end
