module Common

	def mrand
		rand(0..9)
	end

	def bg
		@number[1] = mrand
		@logo << "/output/flag/4#{@number[1]}.png"
	end

	def flag
		@number[1] = mrand
		@number[2] = mrand
		@number[3] = mrand
		@logo << "/output/flag/1#{@number[1]}.png"
		@logo << "/output/flag/2#{@number[2]}.png"
		@logo << "/output/flag/3#{@number[3]}.png"
	end

	def white_bg_mono_figure
		@number[2] = mrand
		@number[3] = mrand
		@logo << "/output/figure/#{@number[3]}#{@number[2]}1.png"
	end

	def mono_figure
		@number[1] = mrand #background color
		@number[2] = mrand #figure color
		@number[3] = mrand #figure_type
		@logo << "/output/flag/4#{@number[1]}.png"
		@logo << "/output/figure/#{@number[3]}#{@number[2]}1.png"
		# @logo << "/output/figure/#{@number[3]}#{@number[2]}0.png"
	end

	def color_figure
		@number[1] = mrand
		@number[2] = mrand
		@number[3] = mrand
		@logo << "/output/figure/#{@number[3]}#{@number[2]}1.png"
		@logo << "/output/figure/#{@number[3]}#{@number[1]}0.png"
	end

	def character_in_one_close
		@number[4] = mrand
		@number[5] = mrand
		@number[6] = mrand
		@logo << "/output/#{@number[4]}XXXXXXX.png"
		@logo << "/output/#{@number[4]}#{@number[6]}0#{@number[5]}XXXX.png"
	end

	def character_in_one_close_with_pattern
		@number[4] = mrand
		@number[5] = mrand
		@number[6] = mrand
		@number[7] = mrand
		@number[8] = mrand
		@logo << "/output/#{@number[4]}XXXXXXX.png"
		@logo << "/output/#{@number[4]}#{@number[6]}0#{@number[5]}XXXX.png"
		@logo << "/output/#{color_folder(@number[7])}/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
	end
end