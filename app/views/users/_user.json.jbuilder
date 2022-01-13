json.extract! user, :id, :email, :email_marketing_category_id, :sign_up_at, :created_at, :updated_at
json.url user_url(user, format: :json)
