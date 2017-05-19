require "movie_scraper/version"
require_relative "scraper"
class Main_methods
  attr_reader :movies_data

  def self.movie_list
  	data_array = Scraper.data_arr
  	data_array.each {|entry| puts entry[:title]} 
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

  def self.make_movies
  @main_data_hash = get_movies
    @main_data_hash.each_pair do |theater,movies_hash|
      theater_name = [] << theater
      @main_data_hash[theater].each_pair do |movie, showtimes|
        @tname = theater.to_s.gsub!(/[^0-9A-Za-z]/, '')
        @title = movie
        @showtimes = showtimes[:showtimes]
          if Movie.all.any? {|m|m.name == movie}
              Movie.all.each do |m|
                if m.name == movie
                  @location_hash = {@tname => @showtimes}
                  m.add_location(@location_hash)
                end   
              end 
           end    
          movie = Movie.new(@title,@showtimes,@tname)
      end 
    end
    check_location
  end 


  

  def self.list_results
    @movie_list = []
    Movie.all.each do |movie|
      puts movie.name
      @movie_list << movie.name
    end 
  end

  def self.show_movie
    Movie.all.each do |movie|
      if movie.name.to_s == @input
        system("clear")
        puts movie.name
        movie.showtimes.each_pair do|l,t|
        puts l
        puts t
      end 
      end 
    end 
  end 

  def self.check_input
    if @input == "exit"
      exit!
    elsif Movie.all.any?{|movie| movie.name.to_s == @input}
      true
    else
      false
    end
  end 

  def self.movie_info
    puts "Look Up Movie By name or type exit"
    @input = gets.chomp
    if check_input == true
      show_movie
      puts "look up another? yes or no"
      @input = gets.chomp
        if @input == "yes"
          list_results
          movie_info
        else  
          exit!
        end 
    else check_input == false
      puts "woops cant find that"
      movie_info
    end 
  end 

  def self.check_location
    if Movie.all == []
      system("clear")
      puts "Oh No! I Can't Find That"
      eixt!
    end 
  end 
end 
