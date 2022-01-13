# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_13_030535) do

  create_table "email_marketing_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "name"
    t.integer "email_marketing_category_id", null: false
    t.string "subject"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_marketing_category_id"], name: "index_email_templates_on_email_marketing_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "email_marketing_category_id", null: false
    t.date "sign_up_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_marketing_category_id"], name: "index_users_on_email_marketing_category_id"
  end

  add_foreign_key "email_templates", "email_marketing_categories"
  add_foreign_key "users", "email_marketing_categories"
end
