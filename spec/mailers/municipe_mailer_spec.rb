require "rails_helper"

RSpec.describe MunicipeMailer, type: :mailer do
  describe "data_change_email" do
    let(:mail) { MunicipeMailer.data_change_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Data change email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
