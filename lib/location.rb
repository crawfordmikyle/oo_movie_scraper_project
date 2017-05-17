class Location
attr_accessor :name, :address, :movies, :showtimes
@@all = []

def self.all
	@@all
end 

def initialize(name)
	@name = name
	@@all << self	
end 

def add_movie(movie,showtimes)

end 

def add_address

end 

end 