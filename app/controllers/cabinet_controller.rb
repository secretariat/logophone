class CabinetController < ApplicationController

	before_filter :authenticate_user!
	layout 'cabinet'

  def index
  	@colors = ["one","two", "three", "four", "five", "six", "seven", "eight"]
  	@logos = Logo.where( :user_id => current_user.id )
  end

  def intro
  end

  def intro_show
  	a = Intro.new( params[:quantity] )
		a.generate_logo
		@logo = a.logo
		@number = a.number
    a.clear
  end

  def training_show
    @quantity = params[:quantity]
    a = Intro.new(params[:quantity])
    a.generate_logo
    @logo = a.logo
    @number = a.number
    a.clear
  end

  private

  def check_train_results( number, results )
    number <=> results
  end
end
