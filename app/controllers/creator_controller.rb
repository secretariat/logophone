# require "creator.rb"
class CreatorController < ApplicationController

  def show
  	@phone = params[:phone]
  	c = Creator.new(@phone)
    # if c.valid?
    	c.generate_logo
      @ar = c.ar
    	session[:logo] = c.ar.join(',')
      @logo = Logo.new( params[:logo] )
    # else
    #   flash[:error] = "Wrong phone number (only digits allowed). Please check and try again"
    #   redirect_to creator_new_path
    # end
  end

  def create
    @logo = Logo.new( params[:logo] )
    @logo.user_id = current_user.id
    # @logo.user_id = 1
    @logo.logo_files = session[:logo]
    # sleep(10)
    if @logo.save
      flash[:success] = "Logotype succefully saved"
      session[:logo] = nil
      redirect_to creator_new_path
    else
      flash[:error] = "Error creating logotype. Please? try again."
      session[:logo] = nil
      redirect_to creator_new_path
    end
  end

end
