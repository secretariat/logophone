ELEMENTS= [
			 [1,0,0,0,0,0,0,0,0,0],
			 [0,1,0,1,0,1,0,0,0,0],
			 [0,0,1,0,1,0,2,2,0,0],
			 [0,1,0,1,0,1,0,0,0,0],
			 [0,0,1,0,1,0,2,2,0,0],
			 [0,1,0,1,0,1,0,0,0,0],
			 [0,0,2,0,2,0,1,2,0,0],
			 [0,0,2,0,2,0,2,1,0,0],
			 [0,0,0,0,0,0,0,0,1,1],
			 [0,0,0,0,0,0,0,0,1,1]]

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
	def initialize(phone)
		puts @phone = phone.last(10)
		@pa = @phone.scan(/\d/).map { |c| c.to_i }
		@pa.insert(0,0)
		@fblock = rand_fblock
		@strict = strictlogo?
		@glasses = need_glasses?
		@overlap = overlap?
		@logo = Hash.new()
	end

	def logo
		@logo
	end

	def get_strict_logo
		if @glasses
			@logo["five_pair"] = "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}000.png"
			@logo["third_pair"] = "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}000.png"
		else
			@logo["third_pair"] = "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
			@logo["fourth_pair"] = "/output/#{color_folder(@pa[7])}/#{@pa[4]}#{@pa[6]}#{overlap?}X#{@pa[8]}#{@pa[7]}XX.png"
			@logo["five_pair"] = "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
		end
	end

	def get_nostrict_logo
		puts @logo["five_pair"] = "/output/#{@pa[4]}#{@pa[10]}#{overlap?}#{@pa[9]}XXXX.png"
		puts @logo["third_pair"] = "/output/#{@pa[4]}#{@pa[6]}#{overlap?}#{@pa[5]}XXXX.png"
	end

	def generate_logo
		puts "LOGO IS IS STRICT: #{@strict}"
		character
		if @strict
			get_strict_logo
		else
			get_nostrict_logo
		end
	end

	def character
		@logo["character"] = "/output/#{@pa[4]}XXXXXXX.png"
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
		res = false
		res = true if( @pa[6] == @pa[10] || ELEMENTS[@pa[6]][@pa[10]] == 1 )
		return res
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
	end

	def proc_fblock
		case @fblock
			when 1 ; flag
			when 2 ; mono_figure
			when 3 ; color_figure
		end
	end

	def flag

	end

	def mono_figure

	end

	def color_figure

	end

end

p = Creator.new("380674615191")
p.generate_logo

# Creator.new("380674685991")