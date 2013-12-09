class Feedback < ActionMailer::Base
  default to: "info@citrusdev.com.ua"

  def feedback_mail( uname, email, msg )
  	@msg = msg
    mail(:from => email, :subject => "New Feedback Message from #{uname}")
  end
end
