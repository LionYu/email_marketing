json.extract! email_template, :id, :name, :email_marketing_category_id, :subject, :content, :created_at, :updated_at
json.url email_template_url(email_template, format: :json)
