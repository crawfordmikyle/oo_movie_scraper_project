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

def self.make_from_arr
	@@all.each do
end 

end 