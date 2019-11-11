class OrderMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3001/rails/mailers/order_mailer/success_notify
  def success_notify
    OrderMailer.success_notify
  end
end
