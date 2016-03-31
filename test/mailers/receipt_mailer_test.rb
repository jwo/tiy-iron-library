require "test_helper"

class ReceiptMailerTest < ActionMailer::TestCase
  def test_send_receipt
    mail = ReceiptMailer.send_receipt
    assert_equal "Send", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
