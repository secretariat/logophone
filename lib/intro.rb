load "funcs.rb"

BOOL = [true,false]

def fwrite( str )
	fd = File.new( Rails.root.join('lib','log.txt'), "a+")
	fd.puts str
	fd.close
end

class Intro

	include Common

	@@number = Array.new(10)

	def initialize( elements_quantity )
		@elements_quantity = elements_quantity
		@logo = Array.new()
		@number = Array.new(10)
	end

	def generate_logo
		case @elements_quantity.to_i
			when 1 ; one
			when 2 ; two
			when 3 ; three
			when 4 ; four
			when 5 ; five
			when 6 ; six
			when 7 ; seven
			when 8 ; eight
			when 9 ; nine
			when 10 ; ten
			# else
		end
		@@number = @number
	end

	def logo
		@logo
	end

	def full_number
		@@number
	end

	def number
		@number
	end

	def one
		fwrite "one"
		if BOOL.sample
			charachter = mrand
			@number[4] = charachter
			@logo << "/output/#{charachter}XXXXXXX.png"
		else
			bg
		end
	end

	def two
		fwrite "two"
		white_bg_mono_figure
	end

	def three
		fwrite "three"
		send( [:mono_figure, :color_figure, :flag, :character_in_one_close ].sample )
	end

	def four
		fwrite "four"
		bg
		character_in_one_close
	end

	def five
		fwrite "five"
		character_in_one_close
		@number[7] = mrand
		@number[8] = mrand
		@logo << "/output/#{color_folder(@number[7])}/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
	end

	def six
		fwrite "six"
		bg
		character_in_one_close_with_pattern
	end

	def seven
		fwrite "seven"
		@number[4] = mrand
		@number[5] = mrand
		@number[6] = mrand
		@number[7] = mrand
		@number[8] = mrand
		@number[9] = mrand
		@number[10] = mrand
		@logo << "/output/#{@number[4]}XXXXXXX.png"
		if( @number[10] == @number[6] || ELEMENTS[@number[6]][@number[10]] == 1 )
			@logo << "/output/glasses/#{@number[4]}XXXXX#{@number[10]}#{@number[9]}.png"
			@logo << "/output/#{@number[4]}#{@number[6]}0#{@number[5]}XXXX.png"
			@logo << "/output/#{color_folder(@number[7])}/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
		else
			if @number[6] > @number[10] && @number[10] != 0
				fwrite "+++++++++++++++++++++"
				@logo << "/output/#{@number[4]}#{@number[10]}#{over_close(@number[10])}#{@number[9]}XXXX.png"
				@logo << "/output/#{@number[4]}#{@number[6]}0#{@number[5]}XXXX.png"
				@logo << "/output/#{color_folder(@number[7])}/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
			else
				fwrite "-------------------------"
				@logo << "/output/#{@number[4]}#{@number[6]}#{over_close(@number[6])}#{@number[5]}XXXX.png"
				@logo << "/output/#{color_folder(@number[7])}/#{@number[4]}#{@number[6]}#{over_close(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
				@logo << "/output/#{@number[4]}#{@number[10]}0#{@number[9]}XXXX.png"
			end
		end
	end

	def eight
		fwrite "eight"
		@number[1] = mrand
		@logo << "/output/flag/4#{@number[1]}.png"
		seven
	end

	def nine
		fwrite "nine"
		white_bg_mono_figure
		seven
	end

	def ten
		fwrite "ten"
		send( [:flag, :color_figure, :mono_figure].sample )
		seven
	end

	def clear
		@logo = nil
		@number = nil
	end
end

# a = Intro.new(3)
# a.generate_logo
# puts a.logo

# y = ar.sample
# send(y)
