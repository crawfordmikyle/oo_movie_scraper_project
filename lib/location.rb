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
	self.add_movies_from_hash
end 

def add_movies_from_hash
	@movies_hash.each_pair do |movie,data|
		movie = Movie.new(movie,data[:showtimes])
		@movie << movie
	end
end 

end 