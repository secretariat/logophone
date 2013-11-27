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
		check_logo
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

	def check_logo
		if @phone_array[6] == @phone_array[8] && @phone_array[8] == @phone_array[10]
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

# Creator.new("380674685991")
# Creator.new("380674615191")