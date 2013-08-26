#Dependancies
require 'csv'
#Class
class Haiku
	$file
	$poem = String.new
	def initialize
		puts "Making a haiku"
		filename = "words.csv"
		$file = CSV.read(filename)
		puts make_poem
	end

	def build_line(size)
		i = 0
		line = String.new
		while i < size  do
		   line
		   line << fetch_random_word << " " 
		   i += 1
		end
		return line
	end

	def make_poem
		$poem << build_line(5) <<"\n"
		$poem << build_line(7) <<"\n"
		$poem << build_line(5) <<"\n"
		return $poem.to_s 
	end
	
	# def self.parse_line(line, options = Hash.new)
	#   new(line, options).shift
	# end
     
	def fetch_random_word
		wordRow =  1 + rand(10000)
		return "#{$file[wordRow].join("''")}"
	end
end

haiku = Haiku.new