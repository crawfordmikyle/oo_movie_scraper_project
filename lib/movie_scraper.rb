require "movie_scraper/version"
require_relative "scraper"
require_relative "Main_methods"
require_relative "movie"
require_relative "location"

class Movie_scraper
	attr_accessor :main_data_hash
	@@tnames = []
	def initialize
		@main_data_hash = Main_methods.get_movies
		@main_data_hash.each_pair do |theater,movies_hash|
			@location = [] << theater
			@main_data_hash[theater].each_pair do |movie, showtimes|
			@title = movie
			@showtimes = showtimes[:showtimes]
				if Movie.all.any? {|m|m.name == movie}
					Movie.all.each do |m|
						if m.name == movie 
							location_hash = {@location => showtimes[:showtimes]}
							m.add_location(location_hash)
						end 
					end 
				else 	
				movie = Movie.new(@title,@showtimes,@location)
				end 
			end 
		end
		list_results
	end 

	def list_results
		Movie.all.each do |movie|
			binding.pry
			puts movie.name
		end 
	end 
end
