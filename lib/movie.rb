class Movie
attr_accessor :name, :reviews, :rating, :locations
@@all = []
def initialize(name,showtimes)
	@locations_showtimes = {}
	@name = name
 	@@all << self
end 

def self.all
	@@all
end 


end 