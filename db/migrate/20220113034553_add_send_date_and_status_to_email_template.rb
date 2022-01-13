class AddSendDateAndStatusToEmailTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :email_templates, :send_date, :date
    add_column :email_templates, :status, :string
  end
end
