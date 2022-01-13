class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.references :email_marketing_category, null: false, foreign_key: true
      t.date :sign_up_at

      t.timestamps
    end
  end
end
