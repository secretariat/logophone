BOOL = [true,false]

def mrand
	rand(0..9)
end

class Intro

	def initialize( elements_quantity )
		@elements_quantity = elements_quantity
		@logo = Array.new()
		@number = Array.new(10)
	end

	def generate_logo
		case @elements_quantity.to_i
			when 1 ; one
			when 2 ; two
			when 3 ; one
			when 4 ; one
			when 5 ; one
			when 6 ; one
			when 7 ; one
			when 8 ; one
			when 9 ; one
			when 10 ; one
			# else
		end
	end

	def logo
		@logo
	end

	def number
		@number
	end

	def one
		if BOOL.sample
			charachter = mrand
			@number[4] = charachter
			@logo << "/output/#{charachter}XXXXXXX.png"
		else
			bg = mrand
			@number[1] = bg
			@logo << "/output/flag/4#{bg}.png"
			@logo << "/output/flag/1#{bg}.png"
			@logo << "/output/flag/2#{bg}.png"
			@logo << "/output/flag/3#{bg}.png"
		end
	end

	def two
		figure_type = mrand
		color_in = mrand
		color_out = mrand
		#EXCLUDE color_in == color_out
		@number[2] = color_in
		@number[3] = color_out
		@logo << "/output/figure/#{figure_type}#{color_out}1.png"
		@logo << "/output/figure/#{figure_type}#{color_in}0.png"
	end

	def three
		
	end
end

a = Intro.new(1)
a.generate_logo
puts a.logo