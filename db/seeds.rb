# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 构造初始化数据
# 初始化数据均由 FFaker 生成，仅用于演示功能

10.times do
  EmailMarketingCategory.create(name: FFaker::Skill.tech_skill)
end

200.times do
  User.create({
    email: FFaker::Internet.safe_email,
    email_marketing_category: EmailMarketingCategory.all.sample,
    sign_up_at: FFaker::Time.between((Time.now - 15.days), Time.now).to_date
  })
end

EmailMarketingCategory.all.each do |t|
  EmailTemplate.create({
    name: "Template For #{t.name}",
    email_marketing_category: t,
    subject: "[AD] News of #{t.name}",
    content: "Email Content for #{t.name}"
  })
end
