# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_12_195513) do

  create_table "application_comments", force: :cascade do |t|
    t.integer "app_id"
    t.integer "author_id_id"
    t.text "text"
    t.boolean "is_flagged"
    t.boolean "is_deleted"
    t.date "date_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_application_comments_on_app_id"
    t.index ["author_id_id"], name: "index_application_comments_on_author_id_id"
  end

  create_table "apps", force: :cascade do |t|
    t.integer "author_id_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id_id"], name: "index_apps_on_author_id_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.integer "app_id"
    t.integer "author_id_id"
    t.date "date_finalized"
    t.boolean "is_pending"
    t.boolean "is_accepted"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_decisions_on_app_id"
    t.index ["author_id_id"], name: "index_decisions_on_author_id_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres_scores", id: false, force: :cascade do |t|
    t.integer "score_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "app_id"
    t.integer "author_id_id"
    t.integer "musicality"
    t.integer "duration"
    t.integer "instrumentation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_ratings_on_app_id"
    t.index ["author_id_id"], name: "index_ratings_on_author_id_id"
  end

  create_table "score_comments", force: :cascade do |t|
    t.integer "score_id"
    t.integer "author_id_id"
    t.text "text"
    t.boolean "is_flagged"
    t.boolean "is_deleted"
    t.date "date_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id_id"], name: "index_score_comments_on_author_id_id"
    t.index ["score_id"], name: "index_score_comments_on_score_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "author_id_id"
    t.integer "app_id"
    t.string "file"
    t.string "title"
    t.text "about"
    t.string "thumbnail"
    t.boolean "is_deleted"
    t.date "date_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_scores_on_app_id"
    t.index ["author_id_id"], name: "index_scores_on_author_id_id"
  end

  create_table "scores_tags", id: false, force: :cascade do |t|
    t.integer "score_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email_address"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.text "bio"
    t.boolean "is_deleted"
    t.date "date_deleted"
    t.boolean "is_admin"
    t.boolean "is_curator"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "application_comments", "apps"
  add_foreign_key "application_comments", "users", column: "author_id_id"
  add_foreign_key "apps", "users", column: "author_id_id"
  add_foreign_key "decisions", "apps"
  add_foreign_key "decisions", "users", column: "author_id_id"
  add_foreign_key "ratings", "apps"
  add_foreign_key "ratings", "users", column: "author_id_id"
  add_foreign_key "score_comments", "scores"
  add_foreign_key "score_comments", "users", column: "author_id_id"
  add_foreign_key "scores", "apps"
  add_foreign_key "scores", "users", column: "author_id_id"
end
