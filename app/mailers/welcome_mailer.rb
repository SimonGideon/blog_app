class WelcomeMailer < ApplicationMailer

  def send_greetings_notification(user)
    @user = user
    mail to: @user.email, subject: "Thank you for signing up!"

    mail to: "to@example.org"
  end
end
