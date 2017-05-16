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

  def self.get_movies
    puts "Welcome To Gems Movie Showtimes"
    puts "Please Enter Your city"
    @city = gets.chomp
    puts "Awesome Now Enter Your States two letter code"
    @state = gets.chomp.upcase
    @link = Scraper.fandango_link_maker(@city,@state)
    @movies_data = Scraper.data_scraper(@link)
    puts @movies_data
  end 

  def make_movies
    @movies.each do |movie|
      movie = Movie.new(movie)
    end
  end 

end