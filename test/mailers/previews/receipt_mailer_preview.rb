# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_mailer/send_receipt
  def send_receipt
    ReceiptMailer.send_receipt
  end

end
