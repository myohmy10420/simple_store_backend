class OrderMailer < ApplicationMailer
  def success_notify
    mail(to: "to@example.org", subject: "購物通知")
  end
end
