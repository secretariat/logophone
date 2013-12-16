class CabinetController < ApplicationController

	before_filter :authenticate_user!
	layout 'cabinet'

  def index
  	@colors = ["one","two", "three", "four", "five", "six", "seven", "eight"]
  	@logos = Logo.where( :user_id => current_user.id )
  	# @logos = Logo.all
  end
end
