#Dependancies
require 'csv'
require_relative 'Ruby-Syllable-Counter/syllablecount'
#Class
class Haiku
	@file
	def initialize
		puts "Making a haiku\n-------------------\n\n"
		filename = "words.csv"
		@file = CSV.read(filename)
		puts make_poem+"\n---------------------"
	end

	def build_line(size)
		i = 0
		line = String.new
		while i < size  do
			new_word = fetch_random_word.downcase
		  line << new_word << " " 
		  i += get_syllable_count(new_word)
		  # puts get_syllable_count(new_word)
		end
		return line
	end

	def make_poem
		return build_line(5) +"\n" + build_line(7) +"\n"+ build_line(5) +"\n"
	end
	
	def get_syllable_count(word)
		#count vowels aeiou
		@word = word
		return @word.syllable_count
	end
     
	def fetch_random_word
		wordRow =  1 + rand(10000)
		return "#{@file[wordRow].join("''")}"
	end
end

haiku = Haiku.new