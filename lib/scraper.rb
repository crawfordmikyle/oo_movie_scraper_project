require 'nokogiri'
require 'open-uri'
class Scraper

def movie_list_scraper(fandango_link)
	@movies = []
	source = Nokogiri::HTML(open('fandango_link'))
	source.css('a.showtimes-movie-title').each do |movie|
		@movies << movie.text.strip
	end 
	@movies
end 



end 