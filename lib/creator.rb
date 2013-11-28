ELEMENTS= [
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,1,0,0,0,0,0,0,0,0],
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,0],
			 [1,0,1,0,1,0,0,0,0,0],
			 [0,0,0,0,0,1,0,0,0,0],
			 [0,0,0,0,0,0,1,0,0,0],
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
		puts strictlogo?
		puts need_glasses?
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

	def character
		puts @phone_array[4]
	end
end

Creator.new("380674615191")
# Creator.new("380674685991")