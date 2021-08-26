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

ActiveRecord::Schema.define(version: 2021_08_26_023841) do

  create_table "recipes", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "recipe_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_recipes_on_users_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "fName"
    t.string "lName"
    t.string "email"
    t.string "password_digest"
    t.integer "access_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "recipes", "users", column: "users_id"
end
