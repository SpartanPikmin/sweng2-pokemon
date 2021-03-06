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

ActiveRecord::Schema.define(version: 2019_06_08_035008) do

  create_table "pokemons", force: :cascade do |t|
    t.integer "team_id"
    t.string "species"
    t.string "primary_type"
    t.string "secondary_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "special_attack"
    t.integer "special_defense"
    t.integer "speed"
    t.string "move1"
    t.string "move2"
    t.string "move3"
    t.string "move4"
    t.index ["team_id"], name: "index_pokemons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pokemon1"
    t.integer "pokemon2"
    t.integer "pokemon3"
    t.integer "pokemon4"
    t.integer "pokemon5"
    t.integer "pokemon6"
  end

end
