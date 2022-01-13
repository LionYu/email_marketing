class EmailTemplate < ApplicationRecord
  belongs_to :email_marketing_category

  validates_presence_of :subject, :content
  validates_uniqueness_of :send_date, scope: :email_marketing_category_id

  has_rich_text :content
end
