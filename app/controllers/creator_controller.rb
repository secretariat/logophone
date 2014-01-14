# require "creator.rb"
class CreatorController < ApplicationController

  def show
  	@phone = params[:phone]
    # c = Creator.new(@phone)
    # c = Creator.new("1385993766") #solved
    # c = Creator.new("9202422877") #solved
    # c = Creator.new("7784086497") #solved
    # c = Creator.new("0009903636") #solved
    # c = Creator.new("0001903666") #solved
    # c = Creator.new("0001469530") #solved
  	c = Creator.new(rand(1000000000..9999999999).to_s)
    # if c.valid?
    	c.generate_logo
      @pn = c.phone
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
      session[:logo] = nil
      flash[:success] = "Logotype succefully saved"
      redirect_to cabinet_index_path
    else
      session[:logo] = nil
      flash[:error] = "Error creating logotype. Please? try again."
      redirect_to creator_new_path
    end
  end

  def destroy
    Logo.find( params[:id] ).destroy
    flash[:notice] = "Logotype succefully deleted"
    redirect_to cabinet_index_path
  end

end
