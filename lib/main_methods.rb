require "movie_scraper/version"
require_relative "scraper"
class Main_methods
  def self.movie_list
  	data_array = Scraper.data_arr
  	data_array.each {|entry| puts entry[:title]} 
  end

  def self.movie_info(title)
  	data_array.each {|entry| puts entry[:rating]}
  end

  def self.fandago_link_maker(city="Berkeley",state="CA")
  	city = city.downcase
  	state = state.downcase
  	city_length =  city.split.size
  	if city_length == 1
  		@fandago_link = "http://www.fandango.com/#{city}_#{state}_movietimes"
 	elsif city_length == 2
 		@fandago_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}_#{state}_movietimes"
  	elsif city_length == 3
  		@fandago_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}+#{city.split[2]}_#{state}_movietimes"
  	else 
  		puts "Woops I cant find that city"
  		exit!
  	end 
  end


end