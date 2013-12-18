BOOL = [true,false]

def mrand
	rand(0..9)
end

class Intro

	def initialize( elements_quantity )
		@elements_quantity = elements_quantity
		@logo = Array.new()
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
			# else 
		end
	end

	def logo
		@logo
	end

	def one
		if BOOL.sample
			@logo << "/output/#{mrand}XXXXXXX.png"
		else
			@logo << "/output/flag/4#{mrand}.png"
			@logo << "/output/flag/1#{mrand}.png"
			@logo << "/output/flag/2#{mrand}.png"
			@logo << "/output/flag/3#{mrand}.png"
		end
	end

	def two
		@logo << "/output/figure/#{mrand}#{mrand}1.png"
		@logo << "/output/figure/#{mrand}#{mrand}0.png"
	end

	def three
		
	end
end

a = Intro.new(2)
a.generate_logo
puts a.logo