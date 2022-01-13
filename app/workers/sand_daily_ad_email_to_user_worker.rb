class SandDailyAdEmailToUserWorker
  include Sidekiq::Worker

  def perform(user_id)
    AdsMailer.daily(user_id).deliver_now
  end
end
