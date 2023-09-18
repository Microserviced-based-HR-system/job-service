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

ActiveRecord::Schema[7.0].define(version: 2023_09_18_131102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "submitted_at"
    t.string "status"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "job_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "job_type_id", null: false
    t.bigint "company_id", null: false
    t.string "title"
    t.text "description"
    t.string "requirements"
    t.string "expired_date"
    t.string "status"
    t.string "location"
    t.integer "no_of_vacancies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "jobs", "job_types"
end
