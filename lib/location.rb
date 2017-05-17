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

def add_movies_from_hash(hash)
	@movies = hash
end 

end 