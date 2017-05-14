class Movie
attr_accessor :name, :locations, :showtimes 
@@all = []
def initalize(name)
	@name = name
	@@all << self
end 

def self.all
	@@all
end 

end 