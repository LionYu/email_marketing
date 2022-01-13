class User < ApplicationRecord
  belongs_to :email_marketing_category

  validates_uniqueness_of :email
end
