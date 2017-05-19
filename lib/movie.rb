class Movie
attr_accessor :name, :showtimes
@@all = []
def initialize(name,showtimes,location)
	@name = name
	@showtimes = {location => showtimes}
 	@@all << self
end 

def self.all
	@@all
end 

def add_location(locations_hash)
	@showtimes.merge!(locations_hash)
end 

end
