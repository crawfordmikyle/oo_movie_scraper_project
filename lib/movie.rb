class Movie
attr_accessor :name, :reviews, :rating
@@all = []
def initalize(name)
	@name = name
	@@all << self
end 

def self.all
	@@all
end 

def self.make_from_arr
	@@all.each do |movie|
		movie = Movie.new(movie)
	end 
end 

end 