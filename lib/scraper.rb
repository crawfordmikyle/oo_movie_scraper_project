require 'nokogiri'
require 'open-uri'
class Scraper

def self.movie_list_scraper(fandango_link)
	@movies = []
	source = Nokogiri::HTML(open(fandango_link))
	source.css('a.showtimes-movie-title').each do |movie|
		@movies << movie.text.strip
	end 
	@movies
end 

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



end 