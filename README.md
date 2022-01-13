# Email Marketing Demo

## 功能设想

#### 概述

每日定时，为已经注册时间满 7 天的用户推送营销邮件。推送营销邮件时，需要根据用户的邮件营销标签选择相应的模板，实现个性化推送。

#### 功能点

- 针对用户
  - 可为用户实例配置营销标签
- 针对邮件模板
  - 可使用富文本编辑器配置邮件内容
  - 需关联营销标签
  - 可配置特定日期，以便于推送该日期下的特殊内容
  - 可配置是否生效
- 定时任务
  - 每日定时发送

## 模型设计

- EmailMarketingCategory
  - name

- User
  - email
  - email_marketing_category_id
  - sign_up_at

- EmailTemplate
  - name
  - email_marketing_category_id
  - subject
  - content

## 运行说明

- Ruby version
  - ruby 3.0.0p0
- Rails version
  - Rails 7.0.1