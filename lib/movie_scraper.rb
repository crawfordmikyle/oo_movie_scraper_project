require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	@@location = []
	def initialize
		@main_data_hash = Main_methods.get_movies
		@main_data_hash.each_pair do |theater,movies_hash|
			Location.new(theater,movies_hash)
		end
		binding.pry
	end 


	def self.locations
		@@location
	end
end
