require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	def initialize
		@main_data_hash = Main_methods.get_movies
		@main_data_hash.each_pair do |theater,movies_hash|
			theater = Location.new(theater,movies_hash)
			end
		list
	end 

	def list
		Location.all.each do |location|
			puts location.name 
			location.movies.each do |movie|
				puts movie.name
				movie.showtimes.each do |showtime|
					puts showtime
				end 
			end 
		end 
	end 

end
