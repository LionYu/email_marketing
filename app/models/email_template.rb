class EmailTemplate < ApplicationRecord
  include AASM

  belongs_to :email_marketing_category

  validates_presence_of :subject, :content
  validates_uniqueness_of :send_date, allow_blank: true, scope: :email_marketing_category_id

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
        add_take_off_err_msg
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
      add_take_off_err_msg
      throw(:abort)
    end
  end

  def add_take_off_err_msg
    self.errors.add(:status, "Category: [#{self.email_marketing_category.name}] must have at least one template online")
  end
end
