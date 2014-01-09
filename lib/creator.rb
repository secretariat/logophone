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

  # validates_format_of :phone, :with => /^[0-9]+$/

	def initialize(phone)
		puts @phone = phone.gsub(/[- ]/, "").last(10)
		@pa = @phone.scan(/\d/).map { |c| c.to_i }
		@pa.insert(0,0)
		@fblock = rand_fblock
		@strict = strictlogo?
		@glasses = need_glasses?
		@overlap = overlap?
		@logo = Hash.new()
		@ar = Array.new()
		@overlaped_closes = [0,1,2,3,4,5,8,9]
	end

	def ar
		@ar
	end

	def get_strict_logo
		if @glasses
			@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
			@ar << "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
			@ar << "/output/glasses/#{@pa[4]}XXXXX#{@pa[10]}#{@pa[9]}.png"
		else
			if @pa[6] < @pa[10]
<<<<<<< HEAD
				@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
				@ar <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
				@ar <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
=======
				if @pa[6] == 0
					@ar <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
					@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
					@ar <<  "/output/#{color_folder(@pa[7])}/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
				else
					@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
					@ar <<  "/output/#{color_folder(@pa[7])}/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
					@ar <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
				end
>>>>>>> aa1041f32f1e151b746ba74b47fa84d67c0ff50f
			else
				@ar <<  "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
<<<<<<< HEAD
				@ar <<  "/output/uzor/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
=======
				@ar <<  "/output/#{color_folder(@pa[7])}/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
				@ar <<  "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
>>>>>>> aa1041f32f1e151b746ba74b47fa84d67c0ff50f
			end
		end
	end

	def get_nostrict_logo
		if @glasses
			@ar << "/output/glasses/#{@pa[4]}XXXXX#{@pa[10]}#{@pa[9]}.png"
			tmp_ar = [ "#{@pa[6]}#{@pa[5]}".to_i, "#{@pa[8]}#{@pa[7]}".to_i ]
			tmp_ar.sort!
			tmp_ar.each do |t|
				str = t.to_s
				@ar << "/output/#{@pa[4]}#{str[0]}#{overlap?}#{str[1]}XXXX.png"
			end
		else
			tmp_ar = [ "#{@pa[6]}#{@pa[5]}".to_i, "#{@pa[8]}#{@pa[7]}".to_i, "#{@pa[10]}#{@pa[9]}".to_i ]
			tmp_ar.sort!
			tmp_ar.each do |t|
				str = sprintf('%02d', t).to_s
				puts "STR1 = #{str[0]}\nSTR2 = #{str[1]} "
				# sleep(5)
				if @overlaped_closes.include?(str[0].to_i)
					@ar << "/output/#{@pa[4]}#{str[0]}0#{str[1]}XXXX.png"
				else
					@ar << "/output/#{@pa[4]}#{str[0]}#{overlap?}#{str[1]}XXXX.png"
				end
			end
		end
	end

	def generate_logo
		puts "LOGO IS IS STRICT: #{@strict}"
		puts "NEED GLASSES: #{@glasses}"
		proc_fblock
		character
		if @strict
			get_strict_logo
		else
			get_nostrict_logo
		end
	end

	def character
		@ar << "/output/#{@pa[4]}XXXXXXX.png"
	end

	def strictlogo?
		res = false
		res = true if(	@pa[6] == @pa[8] ||
										@pa[8] == @pa[10] ||
										@pa[6] == @pa[10] ||
										ELEMENTS[@pa[6]][@pa[8]] == 1 ||
										ELEMENTS[@pa[8]][@pa[10]] == 1 ||
										ELEMENTS[@pa[6]][@pa[10]] == 1 )
		return res
	end

	def need_glasses?
		( @pa[6] == @pa[10] || ELEMENTS[@pa[6]][@pa[10]] == 1 ) ? true:false
	end

	def overlap?
		if( ELEMENTS[@pa[6]][@pa[8]] == 2) then
			if(@pa[6] > @pa[8]) then
				return 1
			else
				return 0
			end
		end
		return 0
	end


	def rand_fblock
		rand(1..3)
		# return 3
	end

	def proc_fblock
		case rand_fblock
			when 1 ; flag
			when 2 ; mono_figure
			when 3 ; color_figure
		end
	end

	def flag
		if(@pa[1] == @pa[2] && @pa[2] == @pa[3])
			@ar << "/output/flag/4#{@pa[1]}.png"
		else
			@ar << "/output/flag/1#{@pa[1]}.png"
			@ar << "/output/flag/2#{@pa[2]}.png"
			@ar << "/output/flag/3#{@pa[3]}.png"
		end
	end

	def mono_figure
		@ar << "/output/flag/4#{@pa[1]}.png"
		@ar << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
	end

	def color_figure
		if(@pa[1] == @pa[2] && @pa[2] == @pa[3])
			@ar << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
		else
			@ar << "/output/figure/#{@pa[3]}#{@pa[2]}1.png"
			@ar << "/output/figure/#{@pa[3]}#{@pa[1]}0.png"
		end
	end

	def revert_overlap( overlap )
		overlap == 1 ? 0:1
	end
end

# p = Creator.new("380674615191")
# p.generate_logo

# Creator.new("380674685991")