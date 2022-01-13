require "test_helper"

class AdsMailerTest < ActionMailer::TestCase
  test "daily" do
    mail = AdsMailer.daily
    assert_equal "Daily", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
