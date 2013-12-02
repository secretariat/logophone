require "creator.rb"
class CreatorController < ApplicationController
  def new
  	# redirect_to creator_show_path
  end

  def show
  	@phone = params[:phone]
  	c = Creator.new(@phone)
  	c.generate_logo
  	@logo = c.logo
  end

end
