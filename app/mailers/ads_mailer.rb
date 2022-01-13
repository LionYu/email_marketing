class AdsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ads_mailer.daily.subject
  #
  def daily user
    @user = user

    email_templates = EmailTemplate.where(email_marketing_category: user.email_marketing_category)
    @email_template = email_templates.where(send_date: Time.now.to_date).last || email_templates.last

    mail to: user.email, subject: @email_template.subject
  end
end
