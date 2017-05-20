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
    city = gets.chomp
    puts "Awesome Now Enter Your States two letter code"
    state = gets.chomp.upcase
    link = Scraper.fandango_link_maker(city,state)
    movies_data = Scraper.data_scraper(link)
    movies_data
  end 

  def self.make_movies
  main_data_hash = get_movies
    main_data_hash.each_pair do |theater,movies_hash|
      theater_name = [] << theater
      main_data_hash[theater].each_pair do |movie, showtimes|
        tname = theater.to_s
        title = movie
        showtimes = showtimes[:showtimes]
          if Movie.all.any? {|m|m.name == movie}
              Movie.all.each do |m|
                if m.name == movie
                  location_hash = {tname => showtimes}
                  m.add_location(location_hash)
                end   
              end 
           end    
          movie = Movie.new(title,showtimes,tname)
      end 
    end
    check_location
  end 

  def self.list_results
    system("clear")
    movie_list = []
    puts "Movies\n\n"
    Movie.all.each do |movie|
      puts movie.name
      movie_list << movie.name
    end 
    puts "\n\n"
    puts "Theaters\n\n"
    Movie.locations.each do |location|
      puts location
    end 
    puts "\n\n"

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

  def self.show_theater
    system("clear")
    Location.all.each do |theater|
      if theater.name.to_s == @input
        theater.movies.each do |movie|
          puts movie.name.to_s
          movie.showtimes.each_pair do |vin,showtimes|
            if vin == theater.name.to_s
            puts showtimes
            end 
          end 
        end 
      end 
    end 
  end 

  def self.check_input
    if @input == "exit"
      exit!
    elsif Movie.all.any?{|movie| movie.name.to_s == @input} || Location.all.any?{|location| location.name.to_s == @input}
      true
    else
      false
    end
  end 

  def self.movie_and_theater_info
    puts "Search Movie or Location By name or type exit"
    @input = gets.chomp
    if check_input == true
      if Movie.all.any?{|movie|movie.name.to_s == @input}
        show_movie
        look_up_another
      elsif Location.all.any?{|location|location.name.to_s == @input} 
        show_theater
        look_up_another
      end 
    else check_input == false
      puts "woops cant find that"
      movie_and_theater_info
    end 
  end 

  def self.check_location
    if Movie.all == []
      system("clear")
      puts "Oh No! I Can't Find That"
      eixt!
    end 
  end

  def self.make_locations
    Movie.locations.each do |location|
      if Location.all.include?(location) == false
        location = Location.new(location)
        location.add_movies
      end 
    end 
  end 

  def self.look_up_another
    puts "\n\n"
    puts "Press Enter"
    @input = gets
    list_results
    movie_and_theater_info
  end 

end 
