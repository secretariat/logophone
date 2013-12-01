ELEMENTS= [
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,1,0,1,0,2,2,0,0,0],
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,1,0,1,0,2,2,0,0,0],
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,2,0,2,0,1,2,0,0,0],
			 [0,2,0,2,0,2,1,0,0,0],
			 [0,0,0,0,0,0,0,1,1,0],
			 [0,0,0,0,0,0,0,1,1,0],
			 [0,0,0,0,0,0,0,0,0,1] ]

class String
  def last(n)
    self[-n,n]
  end
end

class Creator
	def initialize(phone)
		puts @phone = phone.last(10)
		@phone_array = @phone.scan(/\d/).map { |c| c.to_i }
		puts @phone_array.insert(0,0)
		@fblock = rand_fblock
		@strickt = strictlogo?
		@glasses = need_glasses?
		@overlap = overlap?
		@logo = Hash.new()
	end

	def get_strict_logo

	end

	def get_nostrict_logo

	end

	def self.generate_logo
		character
		if @strickt
			get_strict_logo
		else
			get_nostrict_logo
		end
	end

	def character
		@logo['character'] = "/output/#{@phone_array[4]}.png"
	end

	def third_wear
		
	end

	def strictlogo?
		res = false
		res = true if(	@phone_array[6] == @phone_array[8] ||
										@phone_array[8] == @phone_array[10] ||
										@phone_array[6] == @phone_array[10] ||
										ELEMENTS[@phone_array[6]][@phone_array[8]] == 1 ||
										ELEMENTS[@phone_array[8]][@phone_array[10]] == 1 ||
										ELEMENTS[@phone_array[6]][@phone_array[10]] == 1 )
		return res
	end

	def need_glasses?
		res = false
		res = true if( @phone_array[6] == @phone_array[10] || ELEMENTS[@phone_array[6]][@phone_array[10]] == 1 )
		return res
	end

	def overlap?
		if( ELEMENTS[@phone_array[6]][@phone_array[8]] == 2) then
			if(@phone_array[6] > @phone_array[8]) then
				return 1
			else
				return 2
			end
		end
		return 0;
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

Creator.new("380674615191")
Creator.generate_logo

# Creator.new("380674685991")