class Movie
attr_accessor :name, :showtimes
@@all = []
@@locations = []
def initialize(name,showtimes,location)
	@name = name
	@showtimes = {location => showtimes}
 	@@all << self
 	if @@locations.include?(location) == false
 		@@locations << location
 	end 
end 

def self.all
	@@all
end 

def self.locations
	@@locations
end 

def self.find_by_name(n)
	Movie.all.detect{|movie| movie.name.to_s == n}
end 

def add_location(locations_hash)
	@showtimes.merge!(locations_hash)
end  

end
