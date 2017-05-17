class Location
attr_accessor :name, :address, :movies, :showtimes
@@all = []

def self.all
	@@all
end 

def initialize(name,movies_hash)
	@name = name
end 

end 