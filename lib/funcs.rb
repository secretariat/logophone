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

OVER_CLOSES = [0,1,2,3,4,5,8,9]

def over_close( num )
	OVER_CLOSES.include?( num ) ? 0:1
end

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

def fwrite( str )
	fd = File.new( Rails.root.join('lib','log.txt'), "a+")
	fd.puts str
	fd.close
end