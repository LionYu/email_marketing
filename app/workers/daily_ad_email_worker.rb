class DailyAdEmailWorker
  include Sidekiq::Worker

  def perform
    # 考虑到用户熟练可能较多，故将每个用户邮件发送交由对应的异步任务处理
    # User.where("sign_up_at <= ?", Time.now - 7.days).each do |user|
    User.where("sign_up_at <= ?", Time.now - 7.days).limit(10).each do |user|
      SandDailyAdEmailToUserWorker.perform_async(user.id)
    end
  end
end
