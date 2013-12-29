module ApplicationHelper
	def disabled?( num )
		num.present? ? false:true
	end

	def autotab
	  @current_tab ||= 0
	  @current_tab += 1
	end
end
