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
    if !params[:uname].present? || !params[:email].present? || !params[:msg].present?
      flash[:danger] = "All fields are required"
    else
      @msg = params[:msg]
      Feedback.feedback_mail( params[:uname], params[:email], @msg ).deliver
      flash[:success] = "Success!"
    end
    redirect_to(:controller => 'page', :action => 'contacts')
  end

end
