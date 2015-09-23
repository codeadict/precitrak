class AdminMailer < ActionMailer::Base
  default :from => "noreply@precitrack.com"

  def new_user_waiting_for_approval(user)
    mail(:to => 'admin@precitrack.com', :subject => "New user on Precitrack")
  end
end
