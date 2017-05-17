require "movie_scraper/version"
require_relative "scraper"
class Main_methods
  attr_reader :movies_data

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
    @movies_data
  end 

  def self.list_results
    @movie_list = []
    Movie.all.each do |movie|
      puts movie.name
      @movie_list << movie.name
    end 
  end

  def self.show_movie
    puts "look up a movie by name"
    input = gets.chomp
    Movie.all.each do |movie|
      binding.pry
      if movie.name == input
        movie
      end 
    end
  end 
end