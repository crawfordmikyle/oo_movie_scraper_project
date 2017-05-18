class Movie
attr_accessor :name, :reviews, :rating, :locations
@@all = []
def initialize(name,showtimes,showing_data)
	@name = name
	@locations = showing_data
 	@@all << self
end 

def self.all
	@@all
end 

def add_location(locations_hash)
	@locations.merge!(locations_hash)
end 

end
