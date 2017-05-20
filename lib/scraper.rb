require 'nokogiri'
require 'open-uri'
class Scraper

def self.fandango_link_maker(city="Berkeley",state="CA")
  	city = city
  	state = state.downcase
  	city_length =  city.size
  	if city_length == 1
  		@fandango_link = "http://www.fandango.com/#{city[0].downcase}_#{state}_movietimes"
 	  elsif city_length == 2
 		@fandango_link = "http://www.fandango.com/#{city.split[0].downcase}+#{city.split[1].downcase}_#{state}_movietimes"
  	elsif city_length == 3
  		@fandango_link = "http://www.fandango.com/#{city.split[0].downcase}+#{city.split[1].downcase}+#{city.split[2].downcase}_#{state}_movietimes"
  	elsif city_length == 4
      @fandango_link = "http://www.fandango.com/#{city.split[0].downcase}+#{city.split[1].downcase}+#{city.split[2].downcase}+#{city.split[3]}_#{state}_movietimes"
    elsif city_length == 5
      @fandango_link = "http://www.fandango.com/#{city.split[0].downcase}+#{city.split[1].downcase}+#{city.split[2].downcase}+#{city.split[3]}+#{city.split[4]}_#{state}_movietimes"
    else 
  		puts "Woops I cant find that city"
  		exit!
  	end 
  end

  def self.data_scraper(fandango_link)
    movie_data_hash = {}
    source = Nokogiri::HTML(open(fandango_link))
    source.css('div.showtimes-theater').each do |theater|
      th_name = theater.css('a.showtimes-theater-title').text.strip.gsub(/[^0-9A-Za-z]/, '')
      movie_data_hash[:"#{th_name}"] = {}
        theater.css('div.showtimes-movie-container').each do |movie|
          movie_data = {}
          movie_data[:title] = movie.css('a.showtimes-movie-title').text.strip.gsub(/[^0-9A-Za-z]/, '') 
          movie_data[:showtimes] = movie.css('a.btn').text.strip.split("m")
          if movie_data[:showtimes].length == 0
             movie_data[:showtimes] = movie.css('time.non-ticketing').text.strip.split("m")
          end 
          movie_data_hash[:"#{th_name}"][:"#{movie_data[:title]}"] = movie_data
        end 
      end  
      movie_data_hash
    end

  def rating_scraper()
  end   
  end 