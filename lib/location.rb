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

def self.find_by_name(n)
	Location.all.detect{|movie| movie.name.to_s == n}
end 

end 