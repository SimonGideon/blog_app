# Preview all emails at http://localhost:3000/rails/mailers/welcome
class WelcomePreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/welcome/send_greetings_notification
  def send_greetings_notification
    WelcomeMailer.send_greetings_notification
  end
end
