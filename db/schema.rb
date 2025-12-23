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

ActiveRecord::Schema[8.0].define(version: 2025_12_23_005354) do
  create_table "fragments", force: :cascade do |t|
    t.string "clef"
    t.string "nuance"
    t.string "key_signature"
    t.string "time_signature"
    t.string "caractere"
    t.string "tempo"
    t.string "title"
    t.string "myscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newscores", force: :cascade do |t|
    t.string "title"
    t.string "composer"
    t.string "toplevelmarkup"
    t.string "metronomemark"
    t.string "textmark"
    t.string "cmajorsevensymbol"
    t.string "testscript"
    t.string "fingering"
    t.string "notehead"
    t.string "rest"
    t.string "tuplenumber"
    t.string "lyrictext"
    t.string "dynamictext"
    t.string "key_signature"
    t.string "time_signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accord"
  end

  create_table "pics", force: :cascade do |t|
    t.integer "newscore_id"
    t.string "mypic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
