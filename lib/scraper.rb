require 'nokogiri'
require 'open-uri'
class Scraper

def self.fandango_link_maker(city="Berkeley",state="CA")
  	city = city.downcase
  	state = state.downcase
  	city_length =  city.split.size
  	if city_length == 1
  		@fandango_link = "http://www.fandango.com/#{city}_#{state}_movietimes"
 	  elsif city_length == 2
 		@fandango_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}_#{state}_movietimes"
  	elsif city_length == 3
  		@fandango_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}+#{city.split[2]}_#{state}_movietimes"
  	elsif city_length == 4
      @fandango_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}+#{city.split[2]}+#{city.split[3]}_#{state}_movietimes"
    elsif city_length == 5
      @fandango_link = "http://www.fandango.com/#{city.split[0]}+#{city.split[1]}+#{city.split[2]}+#{city.split[3]}+#{city.split[4]}_#{state}_movietimes"
    else 
  		puts "Woops I cant find that city"
  		exit!
  	end 
  end

  def self.locations_list_scraper(fandango_link)
    @locations = []
    @source = Nokogiri::HTML(open(fandango_link))
      source.css('a.showtimes-theater-title').each do |th|
      @locations << th.text.strip.squeeze(" ")
    end
  end



  def self.movie_list_scraper(fandango_link)
    @movies = []
    @source = Nokogiri::HTML(open(fandango_link))
    source.css('a.showtimes-movie-title').each do |movie|
      @movies << movie.text.strip

    end 
    @movies
  end 

  def self.data_scraper(fandango_link)
    @movie_data_arr = []
    source.css('div.showtimes-movie-container').each do |movie|
    movie_data = {}
    movie_data[:title] = movie.css('a.showtimes-movie-title').text.strip    
    movie_data[:showtimes] = movie.css('a.btn').text.strip || movie_data[:showtimes] = movie.css('time.non-ticketing').text.strip
    movie_data_arr << movie_data 
    end

  end 



end 