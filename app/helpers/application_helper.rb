module ApplicationHelper
	def disabled?( num )
		num.present? ? false:true
	end
end
