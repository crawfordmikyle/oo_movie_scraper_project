require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"
require_relative "location"

class self.Movie_scraper
	attr_accessor :movies
	def get_movies
		@movies = Movie.all
		binding.pry
		puts @movies
	end 
end