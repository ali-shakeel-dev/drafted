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

ActiveRecord::Schema[7.2].define(version: 2025_12_24_142642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.string "institution"
    t.string "degree"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_educations_on_resume_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.string "company"
    t.string "role"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_experiences_on_resume_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.string "name"
    t.string "profession"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["resume_id"], name: "index_profiles_on_resume_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.string "name"
    t.text "description"
    t.string "link"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_projects_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "template"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.string "name"
    t.string "level"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_skills_on_resume_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "educations", "resumes"
  add_foreign_key "experiences", "resumes"
  add_foreign_key "profiles", "resumes"
  add_foreign_key "projects", "resumes"
  add_foreign_key "resumes", "users"
  add_foreign_key "skills", "resumes"
end
