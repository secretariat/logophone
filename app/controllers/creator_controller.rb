# require "creator.rb"
class CreatorController < ApplicationController

  layout :get_layout

  def show
    if params[:phone].length < 10 || !params[:phone].present?
      flash[:error] = "Error creating logotype. Please, enter correct phone number!"
      redirect_to creator_new_path
      return
    end
    @phone = params[:phone]
    c = Creator.new(@phone)
    c.clear
    c.generate_logo
    @pn = c.phone
    @ar = c.ar
    session[:logo] = c.ar
    @logo = Logo.new( params[:logo] )
  end

  def chbg
    c = Creator.new(params[:phone])
    c.chbg_plus
    @ar = c.ar
    session[:logo] = c.ar
  end

  def chbgm
    c = Creator.new(params[:phone])
    c.chbg_minus
    @ar = c.ar
    session[:logo] = c.ar
  end

  def chlgp
    c = Creator.new(params[:phone])
    c.chlogop
    @ar = c.ar
    session[:logo] = c.ar
  end

  def chlgm
    c = Creator.new(params[:phone])
    c.chlogom
    @ar = c.ar
    session[:logo] = c.ar
  end

  def create
    @logo = Logo.new( params[:logo] )
    @logo.user_id = current_user.id
    @logo.logo_files = session[:logo].join(',')
    if @logo.save
      session[:logo] = nil
      flash[:success] = "Logotype succefully saved"
      redirect_to cabinet_index_path
    else
      session[:logo] = nil
      flash[:error] = "Error creating logotype. Please, try again."
      redirect_to creator_new_path
    end
  end

  def destroy
    Logo.find( params[:id] ).destroy
    flash[:notice] = "Logotype succefully deleted"
    redirect_to cabinet_index_path
  end

  private

  def get_layout
    user_signed_in? ? "cabinet" : "application"
  end
end
