class EmailTemplate < ApplicationRecord
  include AASM

  belongs_to :email_marketing_category

  validates_presence_of :subject, :content
  validates_uniqueness_of :send_date, scope: :email_marketing_category_id

  has_rich_text :content

  before_destroy :can_destroy?

  aasm column: :status do
    state :draft, initial: true
    state :online, :offline

    event :publish do
      transitions from: [:draft, :offline], to: :online
    end

    event :take_off do
      error do |e|
        self.errors.add(:status, "must have at least one template of category: #{self.email_marketing_category.name} online")
      end
      transitions from: :online, to: :offline, guard: :can_offline?
    end
  end

  def can_offline?
    EmailTemplate.where(email_marketing_category: self.email_marketing_category, status: "online")
                 .where.not(id: self.id).count > 0
  end

  private
  def can_destroy?
    unless can_offline?
      self.errors.add(:status, "must have at least one template of category: #{self.email_marketing_category.name} online")
      throw(:abort)
    end
  end
end
