class CreateEmailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.references :email_marketing_category, null: false, foreign_key: true
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
