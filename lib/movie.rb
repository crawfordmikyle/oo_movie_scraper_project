class Movie
attr_accessor :name, :reviews, :rating, :location, :showtimes
@@all = []
def initialize(name,showtimes)
	@name = name
	@showtimes = showtimes
 	@@all << self
end 

def self.all
	@@all
end 


end 