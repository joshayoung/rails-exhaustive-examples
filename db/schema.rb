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

ActiveRecord::Schema.define(version: 2019_11_07_234918) do

  create_table "degrees", force: :cascade do |t|
    t.string "title"
    t.decimal "level"
    t.date "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
    t.string "from"
    t.index ["teacher_id"], name: "index_degrees_on_teacher_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.time "time"
    t.decimal "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
    t.index ["teacher_id"], name: "index_klasses_on_teacher_id"
  end

  create_table "registrars", force: :cascade do |t|
    t.integer "klass_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klass_id"], name: "index_registrars_on_klass_id"
    t.index ["student_id"], name: "index_registrars_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "average_grade"
    t.date "class_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
