class Movie
attr_accessor :name, :reviews, :rating, :location
@@all = []
def initalize(name,showtimes)
	@name = name
	@showtimes = showtimes
 	@@all << self
end 

def self.all
	@@all
end 


end 