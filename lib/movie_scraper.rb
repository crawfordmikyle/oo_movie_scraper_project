require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require 'pry'
class Movie_scraper
	def get_movies
		@movies = Movie.all
		binding.pry
		puts @movies
	end 

end