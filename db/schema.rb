# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4000) do

  create_table "divisions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "tournament_id"
    t.bigint "team_id"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_divisions_on_name", unique: true
    t.index ["team_id"], name: "index_divisions_on_team_id"
    t.index ["tournament_id"], name: "index_divisions_on_tournament_id"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "a_team_id"
    t.bigint "b_team_id"
    t.integer "score_a"
    t.integer "score_b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_team_id"], name: "index_games_on_a_team_id"
    t.index ["b_team_id"], name: "index_games_on_b_team_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "tournaments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tournaments_on_name", unique: true
  end

  add_foreign_key "divisions", "teams"
  add_foreign_key "divisions", "tournaments"
  add_foreign_key "games", "teams", column: "a_team_id"
  add_foreign_key "games", "teams", column: "b_team_id"
end
