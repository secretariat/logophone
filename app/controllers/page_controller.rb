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

  def feedback
    @msg = params[:msg]
    Feedback.feedback_mail( params[:uname], params[:email] ).deliver
    redirect_to(:controller => 'page', :action => 'contacts')
  end

end
