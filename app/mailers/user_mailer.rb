class UserMailer < ActionMailer::Base
  default from: "Food Shift <" + ENV["EMAIL_USERNAME"] + ">"

  def donation_available(recipient_ids, donation)
    @donation = donation
    recipient_ids.each do |r|
      @recipient = Recipient.find(r)
      @email = @recipient.email
      mail(to: @email, subject: "(Recipient) Donation Available!")
    end
  end

  def recipient_match(recipients)
    mail(to: recipients, subject: "Your donation has found a recipient!")
  end

  def coordinator_email(recipients, donation)
    @donation = donation
    mail(to: recipients, subject: "(Coordinator) Donation Posted!")
  end
end
