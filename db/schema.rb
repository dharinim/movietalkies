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

ActiveRecord::Schema.define(version: 20170426172306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "poster_path"
    t.boolean  "adult"
    t.string   "overview"
    t.date     "release_date"
    t.integer  "id_original"
    t.string   "original_title"
    t.string   "original_language"
    t.string   "backdrop_path"
    t.integer  "popularity"
    t.integer  "vote_count"
    t.string   "video"
    t.integer  "vote_average"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "the_movie_db_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "rating"
    t.string   "comment"
    t.date     "review_date"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "review_id"
    t.index ["review_id"], name: "index_users_on_review_id", using: :btree
  end

end
