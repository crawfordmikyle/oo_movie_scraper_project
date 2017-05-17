require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	def initialize
		@main_data_hash = Main_methods.get_movies
		@main_data_hash.each do |location|
			binding.pry
			location = Location.new(location)
		end
	end 
end