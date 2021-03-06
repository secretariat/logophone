load "funcs.rb"

BOOL = [true,false]

class TestMode

	attr_accessor :logo
	attr_accessor :number
	cattr_accessor :stage
	cattr_accessor :round
	cattr_accessor :current_round
	cattr_accessor :full

	include Common

	@@number = Array.new(10)
	@@logo = []
	@@stage = 1
	@@round = 1
	@@current_round = 1

	def initialize
		@logo = Array.new()
		@number = Array.new(10)
	end

	def generate_full_logo
		ten
		@@number = @number
		@@logo = @logo
		@@full = false
	end

	def generate_logo
		case @@stage.to_i
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
		@@logo = @logo
		@@full = true
	end

	def check_logo
		@@logo
	end

	def increase_stage
		@@stage += 1
		next_round if @@stage >= 11
	end

	def reset_stage
		@@stage = 1
	end

	def reset_round
		@@round = 1
	end

	def next_round
		@@stage = 1
		@@round += 1
	end

	def clear_full_number
		puts "clearing"
		@@number.clear
		puts "number  " + @@number.to_s
	end

	def full_number
		@@number
	end

	def one
		if BOOL.sample
			charachter = mrand
			@number[4] = charachter
			@logo << "/output/#{charachter}XXXXXXX.png"
		else
			bg
		end
	end

	def two
		white_bg_mono_figure
	end

	def three
		send( [:mono_figure, :color_figure, :flag, :character_in_one_close ].sample )
	end

	def four
		bg
		character_in_one_close
	end

	def five
		character_in_one_close
		@number[7] = mrand
		@number[8] = mrand
		@logo << "/output/uzor/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
	end

	def six
		bg
		character_in_one_close_with_pattern
	end

	def seven
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
			@logo << "/output/#{@number[4]}#{@number[6]}#{over_close(@number[6])}#{@number[5]}XXXX.png"
			@logo << "/output/uzor/#{@number[4]}#{@number[6]}#{over_close(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
		else
			if @number[6] < @number[10]
				if @number[6] == 0
					@logo <<  "/output/#{@number[4]}#{@number[10]}#{overlap?(@number[10])}#{@number[9]}XXXX.png"
					@logo <<  "/output/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}#{@number[5]}XXXX.png"
					@logo <<  "/output/uzor/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
				else
					@logo <<  "/output/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}#{@number[5]}XXXX.png"
					@logo <<  "/output/uzor/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
					@logo <<  "/output/#{@number[4]}#{@number[10]}#{overlap?(@number[10])}#{@number[9]}XXXX.png"
				end
			else
				if @number[10] == 0
					if @number[6] == 7 || @number[6] == 8 || @number[6] == 9
						@logo <<  "/output/#{@number[4]}#{@number[10]}#{overlap?(@number[10])}#{@number[9]}XXXX.png"
						@logo <<  "/output/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}#{@number[5]}XXXX.png"
						@logo <<  "/output/uzor/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
					else
						@logo <<  "/output/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}#{@number[5]}XXXX.png"
						@logo <<  "/output/uzor/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
						@logo <<  "/output/#{@number[4]}#{@number[10]}#{overlap?(@number[10])}#{@number[9]}XXXX.png"
					end
				else
					@logo <<  "/output/#{@number[4]}#{@number[10]}#{overlap?(@number[10])}#{@number[9]}XXXX.png"
					@logo <<  "/output/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}#{@number[5]}XXXX.png"
					@logo <<  "/output/uzor/#{@number[4]}#{@number[6]}#{overlap?(@number[6])}X#{@number[8]}#{@number[7]}XX.png"
				end
			end
		end
	end

	def eight
		@number[1] = mrand
		@logo << "/output/flag/4#{@number[1]}.png"
		seven
	end

	def nine
		white_bg_mono_figure
		seven
	end

	def ten
		send( [:flag, :color_figure, :mono_figure].sample )
		seven
	end

	def clear
		@logo = nil
		@number = nil
	end
end
