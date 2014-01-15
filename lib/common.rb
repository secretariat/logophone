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
		@logo << "/output/uzor/#{@number[4]}#{@number[6]}0X#{@number[8]}#{@number[7]}XX.png"
	end

	def overlap?( num )
		if( ELEMENTS[@number[6]][@number[8]] == 2 ||
				ELEMENTS[@number[6]][@number[10]] == 2 ||
				ELEMENTS[@number[8]][@number[10]] == 2 ) then
			underwear = [ @number[6], @number[10] ]

			###########################coliision for bull, mice and cat with jacket and coat###################
			return 1 if (@number[4] == 1 || @number[4] == 2 || @number[4] == 4 || @number[4] == 5 ) &&
									(underwear.include?(9) || underwear.include?(8)) &&
									underwear.include?(7) && (num == 7)
			#####################################################################################

			rule_for_underwear = [0,1,2,3,4,5,8,9]
			rule_for_under_coat = [6,7]
			top_wear_under_shirt = [2,4]
			if rule_for_under_coat.include?(num)
				return 0 if num == 7 && (underwear.include?(6) || underwear.include?(0))
				bret = false
				underwear.each do |wear|
					bret = true if top_wear_under_shirt.include?(wear)
				end
				return bret ? 0:1
			else
				if rule_for_underwear.include?(num)
					return 0
				else
					return 1
				end
			end
		end
		return 0
	end
end