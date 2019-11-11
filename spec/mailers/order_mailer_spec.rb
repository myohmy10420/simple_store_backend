require 'rails_helper'

RSpec.describe OrderMailer, type: :mailer do
  describe 'success_notify' do
    let(:mail) { OrderMailer.success_notify }

    it 'renders the headers' do
      expect(mail.subject).to eq('購物通知')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end
  end

end
