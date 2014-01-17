# require "creator.rb"
class CreatorController < ApplicationController

  def show
  	@phone = params[:phone]
    c = Creator.new(@phone)
    # c = Creator.new("3539627440") # + tie under mayka
    # c = Creator.new("6463724080") # + tie under mayka
    # c = Creator.new("6464704083") # + tie under mayka
    # c = Creator.new("0675565456") # + tie under mayka
    # c = Creator.new("0673967245") # + tie under mayka


    # c = Creator.new("4444560880") # + tie under mayka
    # c = Creator.new("7482078890") # + tie under mayka
  	# c = Creator.new(rand(1000000000..9999999999).to_s)
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
