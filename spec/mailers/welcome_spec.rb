require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  describe 'send_greetings_notification' do
    let(:mail) { WelcomeMailer.send_greetings_notification }

    it 'renders the headers' do
      expect(mail.subject).to eq('Send greetings notification')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
