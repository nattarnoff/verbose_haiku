#Dependancies
require 'csv'
#Class
class Haiku
	$file
	$poem
	def initialize
		puts "Making a haiku"
		filename = "words.csv"
		$file = CSV.read(filename)
		puts make_poem
	end

	def build_line(size)
		$i = 0
		$num = size
		$line = ''
		while $i < $num  do
		   $line += fetch_random_word
		   puts $line
		   $i += 1
		end
	end

	def make_poem
		$poem = build_line(5).to_s
		$poem = build_line(7).to_s
		$poem = build_line(5).to_s
		return $poem
	end
	
	# def self.parse_line(line, options = Hash.new)
	#   new(line, options).shift
	# end
     
	def fetch_random_word
		wordRow =  1 + rand(10000)
		return $file[wordRow].to_s
	end
end

haiku = Haiku.new