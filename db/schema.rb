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

ActiveRecord::Schema[7.0].define(version: 2023_11_28_124857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "isbn", null: false
    t.string "author", null: false
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_available", default: true
    t.integer "copies", default: 1
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "borrower_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "borrower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date", null: false
    t.index ["book_id"], name: "index_borrower_books_on_book_id"
    t.index ["borrower_id"], name: "index_borrower_books_on_borrower_id"
  end

  create_table "borrowers", force: :cascade do |t|
    t.string "name", null: false
    t.string "card_title", null: false
    t.string "card_number", null: false
    t.string "card_csv", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_borrowers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_borrowers_on_reset_password_token", unique: true
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_borrowers", force: :cascade do |t|
    t.bigint "library_id", null: false
    t.bigint "borrower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_library_borrowers_on_borrower_id"
    t.index ["library_id"], name: "index_library_borrowers_on_library_id"
  end

  add_foreign_key "borrower_books", "books"
  add_foreign_key "borrower_books", "borrowers"
  add_foreign_key "library_borrowers", "borrowers"
  add_foreign_key "library_borrowers", "libraries"
end
