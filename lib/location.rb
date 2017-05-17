class Location
attr_accessor :name, :address, :movies, :showtimes
@@all = []

def self.all
	@@all
end 

def initialize(name,movies_hash)
	@name = name
	@movies_hash = movies_hash
	@@all << self	
end 

def add_movies_from_hash(hash)
	@movies_hash = hash
	binding.pry
end 

end 