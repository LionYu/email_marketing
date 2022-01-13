# Preview all emails at http://localhost:3000/rails/mailers/ads_mailer
class AdsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ads_mailer/daily
  def daily
    AdsMailer.daily(User.first)
  end

end
