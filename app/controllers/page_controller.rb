require "creator.rb"
class PageController < ApplicationController
  def index
  end

  def download
  end

  def login
  end

  def register
  end

  def elements
  end

  def decoder
  end

  def creator
    # Creator.new(params[:phone])
  end

  def create_logo
    c = Creator.new(params[:phone])
    c.character
    sleep(10)
    redirect_to :back
  end
end
