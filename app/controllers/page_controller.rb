require "creator.rb"
class PageController < ApplicationController

  def index
    session[:lang] = "ru" if session[:lang].nil?
    session[:theme] = "dark" if session[:theme].nil?
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
      flash[:danger] = "#{t 'feedback.danger'}"
    else
      @msg = params[:msg]
      Feedback.feedback_mail( params[:uname], params[:email], @msg ).deliver
      flash[:success] = "#{t 'feedback.success'}"
    end
    redirect_to(:controller => 'page', :action => 'contacts')
  end

  def set_light
    session[:theme] = "light"
    redirect_to(request.env["HTTP_REFERER"])
  end

  def set_dark
    session[:theme] = "dark"
    redirect_to(request.env["HTTP_REFERER"])
  end

  def set_en
    session[:lang] = "en"
    redirect_to(request.env["HTTP_REFERER"])
  end

  def set_ru
    session[:lang] = "ru"
    redirect_to(request.env["HTTP_REFERER"])
  end

  def download_android
    send_file File.join(Rails.root, "/public/output/downloads/logophone.apk"),
              :type => "application/vnd.android.package-archive",
              :filename => "logophone.apk"
  end
end
