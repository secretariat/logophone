load "funcs.rb"

def color_folder(color_id)
	case color_id.to_i
	when 1; return "red"
	when 2; return "orange"
	when 3; return "yellow"
	when 4; return "green"
	when 5; return "lblue"
	when 6; return "blue"
	when 7; return "violet"
	when 8; return "brown"
	when 9; return "black"
	when 0; return "white"
	end
end


class String
  def last(n)
    self[-n,n]
  end
end

class Creator

	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :phone
  cattr_accessor :ar, :block_logo_size
  # validates_format_of :phone, :with => /^[0-9]+$/

	@@mono_figure_block = Array.new()
	@@color_figure_block = Array.new()
	@@block_array = Array.new()
	@@ar = Array.new()
	@@cur_index = 0
	@@strict_logo = Array.new()
	@@strict_logo_glasses = Array.new()
	@@nostrict_logo = Array.new()
	@@nostrict_logo_glasses = Array.new()
	@@block_logo = Array.new()
	@@cur_logo = 0

	def initialize(phone)
		puts @phone = phone.gsub(/[- ]/, "").last(10)
		@pa = @phone.scan(/\d/).map { |c| c.to_i }
		@pa.insert(0,0)
		@strict = strictlogo?
		@glasses = need_glasses?
		# @overlap = overlap?
		@current_block = Array.new()
		@logo = Hash.new()
		@@flag_block = Array.new()
		@overlaped_closes = [0,1,2,3,4,5,8,9]
	end

	def clear
		@@ar = []
		@@cur_index = 0
		@@block_array = []
		@@color_figure_block = []
		@@mono_figure_block = []
		@@strict_logo = []
		@@strict_logo_glasses = []
		@@nostrict_logo = []
		@@block_logo = []
	end

	def get_strict_logo
		# if @glasses
		# 	@@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
		# 	@@ar << "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
		# 	@@ar << "/output/glasses/#{@pa[4]}XXXXX#{@pa[10]}#{@pa[9]}.png"
		# else
		@@strict_logo << "/output/#{@pa[4]}XXXXXXX.png"
			if @pa[6] < @pa[10]
				if @pa[6] == 0
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?(@pa[10])}#{@pa[9]}XXXX.png"
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
					@@strict_logo <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
				else
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
					@@strict_logo <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?(@pa[10])}#{@pa[9]}XXXX.png"
				end
			else
				if @pa[10] == 0
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
					@@strict_logo <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?(@pa[10])}#{@pa[9]}XXXX.png"
				else
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?(@pa[10])}#{@pa[9]}XXXX.png"
					@@strict_logo <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
					@@strict_logo <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
				end
			end
		# end
		@@block_logo << @@strict_logo
	end

	def get_strict_logo_glasses
		@@strict_logo_glasses << "/output/#{@pa[4]}XXXXXXX.png"
		@@strict_logo_glasses <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}#{@pa[5]}XXXX.png"
		@@strict_logo_glasses << "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?(@pa[6])}X#{@pa[8]}#{@pa[7]}XX.png"
		@@strict_logo_glasses << "/output/glasses/#{@pa[4]}XXXXX#{@pa[10]}#{@pa[9]}.png"
		@@block_logo << @@strict_logo_glasses
	end

	def get_nostrict_logo
		# if @glasses
		# 	@@ar << "/output/glasses/#{@pa[4]}XXXXX#{@pa[10]}#{@pa[9]}.png"
		# 	tmp_ar = [ "#{@pa[6]}#{@pa[5]}".to_i, "#{@pa[8]}#{@pa[7]}".to_i ]
		# 	tmp_ar.sort!
		# 	tmp_ar.each do |t|
		# 		str = t.to_s
		# 		@@ar << "/output/#{@pa[4]}#{str[0]}#{overlap?(str[0].to_i)}#{str[1]}XXXX.png"
		# 	end
		# else
			tmp_ar = [ "#{@pa[6]}#{@pa[5]}".to_i, "#{@pa[8]}#{@pa[7]}".to_i, "#{@pa[10]}#{@pa[9]}".to_i ]
			tmp_ar.sort!
			if tmp_ar[0].to_i < 10 then
				tie = tmp_ar[0]
				tmp_ar.delete_at(0)
				trousers = [1,3,5]
				nead_tie_under = [7,8,9]
				need_tie_beetween = [2,4,6]
				# if tmp_ar[0].to_s[0].to_i > 6 && tmp_ar[1].to_s[0].to_i <= 9
					# (tmp_ar[0].to_s[0].to_i == 7) ?	tmp_ar.insert(0, tie) : tmp_ar.insert(1, tie)
				if need_tie_beetween.include?(tmp_ar[0].to_s[0].to_i) && nead_tie_under.include?(tmp_ar[1].to_s[0].to_i)
					tmp_ar.insert(1, tie)
				elsif trousers.include?(tmp_ar[0].to_s[0].to_i) && nead_tie_under.include?(tmp_ar[1].to_s[0].to_i)
					tmp_ar.insert(1, tie)
				elsif nead_tie_under.include?(tmp_ar[0].to_s[0].to_i) && nead_tie_under.include?(tmp_ar[1].to_s[0].to_i)
					tmp_ar.insert(0, tie)
				else
					tmp_ar.push(tie)
				end
			end
			@@nostrict_logo << "/output/#{@pa[4]}XXXXXXX.png"
			tmp_ar.each do |t|
				str = sprintf('%02d', t).to_s
				if @overlaped_closes.include?(str[0].to_i)
					@@nostrict_logo << "/output/#{@pa[4]}#{str[0]}0#{str[1]}XXXX.png"
				else
					@@nostrict_logo << "/output/#{@pa[4]}#{str[0]}#{overlap?(str[0].to_i)}#{str[1]}XXXX.png"
				end
			end
			@@block_logo << @@nostrict_logo
		# end
	end

	def generate_logo
		puts "LOGO IS IS STRICT: #{@strict}"
		puts "NEED GLASSES: #{@glasses}"
		get_first_block
		character
		#logo_generating here
		get_logo
		get_block_logo_size
		@@ar = @@block_logo[0].dup
		@@ar.reverse!
		@current_block.reverse!
		@@ar.concat(@current_block).reverse!
		@current_block.reverse!
	end

	def character
		@@ar << "/output/#{@pa[4]}XXXXXXX.png"
	end


	def strictlogo?
		( @pa[6] == @pa[10] || ELEMENTS[@pa[6]][@pa[10]] == 1 ) ? true:false
	end

	def need_glasses?
		( @pa[6] == @pa[10] || ELEMENTS[@pa[6]][@pa[10]] == 1 ) ? true:false
	end

	def six_ten_compatible?
		(ELEMENTS[@pa[6]][@pa[10]] != 1) ? true:false
	end

	def six_eight_ten_compatible?
	(	@pa[6] == @pa[8] || @pa[8] == @pa[10] || @pa[6] == @pa[10] ||
		ELEMENTS[@pa[6]][@pa[8]] == 1 || ELEMENTS[@pa[8]][@pa[10]] == 1 || ELEMENTS[@pa[6]][@pa[10]] == 1 ) ? false : true
	end

	def overlap?( num )
		if( ELEMENTS[@pa[6]][@pa[8]] == 2 ||
				ELEMENTS[@pa[6]][@pa[10]] == 2 ||
				ELEMENTS[@pa[8]][@pa[10]] == 2 ) then
			underwear = [ @pa[6], @pa[8], @pa[10] ]

			#########coliision for bull, mice, gorilla and cat with jacket and coat##############
			return 1 if (@pa[4] == 1 || @pa[4] == 2 || @pa[4] == 4 || @pa[4] == 5 ) &&
									(underwear.include?(9) || underwear.include?(8)) &&
									underwear.include?(7) && (num == 7)
			#####################################################################################

			rule_for_underwear = [0,1,2,3,4,5,8,9]
			rule_for_under_coat = [6,7]
			top_wear_under_shirt = [2,4]
			if rule_for_under_coat.include?(num)
				return 0 if num == 7 && underwear.include?(6)
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

	def chbg_plus
		@@cur_index += 1
		@@ar = @@ar.drop(3)
		if @@cur_index > 2
			@@cur_index = 0
		end
		# puts "++++++++++++++#{@@cur_index}"
		@current_block = @@block_array[@@cur_index].dup
		@@ar.reverse!
		@current_block.reverse!
		@@ar.concat(@current_block).reverse!
		# puts "++++++++++++++#{@@cur_index}"
	end

	def chbg_minus
		@@cur_index -= 1
		if @@cur_index < 0
			@@cur_index = 2
		end
		@@ar = @@ar.drop(3)
		# puts "========AR DROPPED========"
		@current_block = @@block_array[@@cur_index].dup
		# puts "====CUR BLOCK WAS SET====="
		@@ar.reverse!
		# puts "=======AR REVERSED========"
		@current_block.reverse!
		# puts "=======CB REVERSED========"
		(@@ar.concat(@current_block)).reverse!
		# puts "=======check========"
	end


	def get_first_block
		mono_figure
		flag
		color_figure
		@current_block = @@block_array[0]
	end


	def flag
		if(@pa[1] == @pa[2] && @pa[2] == @pa[3])
			@@flag_block << "/output/flag/4#{@pa[1]}.png"
			@@flag_block << ""
			@@flag_block << ""
		else
			@@flag_block << "/output/flag/1#{@pa[1]}.png"
			@@flag_block << "/output/flag/2#{@pa[2]}.png"
			@@flag_block << "/output/flag/3#{@pa[3]}.png"
		end
		@@block_array << @@flag_block
	end

	def mono_figure
		@@mono_figure_block << "/output/flag/4#{@pa[1]}.png"
		@@mono_figure_block << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
		@@mono_figure_block << ""
		@@block_array << @@mono_figure_block
	end


	def color_figure
		if(@pa[1] == @pa[2] && @pa[2] == @pa[3])
			@@color_figure_block << "/output/flag/40.png"
			@@color_figure_block << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
			@@color_figure_block << ""
		else
			@@color_figure_block << "/output/flag/40.png"
			@@color_figure_block << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
			@@color_figure_block << "/output/figure/#{@pa[3]}#{@pa[1]}0.png"
		end
		@@block_array << @@color_figure_block
	end

	def get_logo
		if need_glasses?
			get_strict_logo_glasses
		else
			get_strict_logo if six_ten_compatible?
			get_nostrict_logo if six_eight_ten_compatible?
			get_strict_logo_glasses
		end
		puts @@block_logo.size
		# sleep(1)
	end

	def chlogom
		@@cur_logo -= 1
		if @@cur_logo < 0
			@@cur_logo = @@block_logo_size-1
		end
		@@ar.reverse!
		@@ar = @@ar.drop(4)
		@@ar.reverse!
		@@ar.concat(@@block_logo[@@cur_logo])
	end

	def chlogop
		@@cur_logo += 1
		if @@cur_logo > @@block_logo_size-1
			@@cur_logo = 0
		end
		@@ar.reverse!
		@@ar = @@ar.drop(4)
		@@ar.reverse!
		@@ar.concat(@@block_logo[@@cur_logo])
	end

	def get_block_logo_size
		@@block_logo_size = @@block_logo.size
	end

end
