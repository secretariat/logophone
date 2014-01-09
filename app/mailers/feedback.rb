class Feedback < ActionMailer::Base
  # default to: "info@citrusdev.com.ua"
  default to: "victorstechenko@gmail.com"

  def feedback_mail( uname, email, msg )
  	@msg = msg
  	@email = email
  	@uname = uname
    mail(:from => "noreply@logophone.org", :subject => "New Feedback Message from #{uname}")
  end
end
