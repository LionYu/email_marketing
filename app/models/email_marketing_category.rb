class EmailMarketingCategory < ApplicationRecord
  has_many :users
  has_many :email_templates

  validates_uniqueness_of :name
end
