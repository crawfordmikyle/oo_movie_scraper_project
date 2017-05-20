class Location
attr_accessor :name, :movies
@@all = []

def initialize(name)
	@name = name
	@movies = []
	@@all << self
end 

def add_movies
	Movie.all.each do |movie|
		if movie.showtimes.has_key?(self.name)
			@movies << movie
		end
	end 
end 

def self.all
	@@all
end 

end 