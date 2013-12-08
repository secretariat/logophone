class Feedback < ActionMailer::Base
  default from: "noreply@lgophone.org"

  def feedback_mail( uname, email )
    mail(:to => email, :subject => "New Feedback Message from #{uname}")
  end
end
