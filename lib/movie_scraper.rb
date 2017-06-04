require "movie_scraper/version"
require_relative "scraper"
require_relative "cli"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	def initialize
		Cli.make_movies
		Cli.make_locations
		Cli.list_results
		Cli.movie_and_theater_info
	end  
end
