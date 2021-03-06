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

ActiveRecord::Schema.define(version: 2020_12_10_164820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "beaches", force: :cascade do |t|
    t.string "name"
    t.decimal "lat"
    t.decimal "lng"
    t.decimal "overall_rating", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "overview"
    t.decimal "overall_parking", default: "0.0"
    t.decimal "overall_restaurant", default: "0.0"
    t.decimal "overall_public_transportation", default: "0.0"
    t.decimal "overall_security", default: "0.0"
    t.decimal "overall_cleaning", default: "0.0"
    t.decimal "overall_rent_equipment", default: "0.0"
    t.decimal "overall_wave", default: "0.0"
    t.decimal "overall_wind", default: "0.0"
    t.decimal "overall_accessibility", default: "0.0"
    t.decimal "overall_sand_strip", default: "0.0"
  end

  create_table "buoy_stations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buoy_values", force: :cascade do |t|
    t.bigint "buoy_station_id", null: false
    t.datetime "date_time"
    t.decimal "pressure"
    t.decimal "air_temperature"
    t.decimal "humidity"
    t.decimal "wind_speed"
    t.string "wind_direction"
    t.decimal "wave_height"
    t.decimal "wave_formation"
    t.string "wave_direction"
    t.decimal "water_temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buoy_station_id"], name: "index_buoy_values_on_buoy_station_id"
  end

  create_table "cleaning_stations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cleaning_values", force: :cascade do |t|
    t.bigint "cleaning_station_id", null: false
    t.datetime "date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status"
    t.index ["cleaning_station_id"], name: "index_cleaning_values_on_cleaning_station_id"
  end

  create_table "ocean_forecast_values", force: :cascade do |t|
    t.datetime "date_time"
    t.decimal "water_temperature"
    t.decimal "wave_height"
    t.integer "wave_formation"
    t.string "wave_direction"
    t.bigint "beach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beach_id"], name: "index_ocean_forecast_values_on_beach_id"
  end

  create_table "real_time_values", force: :cascade do |t|
    t.bigint "beach_id", null: false
    t.datetime "date_time"
    t.decimal "wave_height"
    t.string "wave_direction"
    t.string "wave_formation"
    t.decimal "wind_speed"
    t.string "wind_direction"
    t.integer "humidity"
    t.decimal "pressure"
    t.decimal "air_temperature"
    t.decimal "water_temperature"
    t.boolean "cleaning"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.decimal "air_temperature_feels_like"
    t.string "icon"
    t.index ["beach_id"], name: "index_real_time_values_on_beach_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "parking"
    t.integer "restaurant"
    t.integer "public_transportation"
    t.integer "security"
    t.integer "cleaning"
    t.integer "rent_equipment"
    t.integer "wave"
    t.integer "wind"
    t.integer "accessibility"
    t.integer "sand_strip"
    t.bigint "beach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.bigint "user_id"
    t.index ["beach_id"], name: "index_reviews_on_beach_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tides", force: :cascade do |t|
    t.datetime "date_time"
    t.decimal "tide"
    t.string "tide_situation"
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
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visual_stations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visual_values", force: :cascade do |t|
    t.decimal "wave_height"
    t.string "wave_formation"
    t.string "wave_direction"
    t.decimal "water_temperature"
    t.bigint "visual_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date_time"
    t.index ["visual_station_id"], name: "index_visual_values_on_visual_station_id"
  end

  create_table "water_forecast_stations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "water_forecast_values", force: :cascade do |t|
    t.datetime "date_time"
    t.decimal "water_temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "water_forecast_station_id"
    t.index ["water_forecast_station_id"], name: "index_water_forecast_values_on_water_forecast_station_id"
  end

  create_table "wave_forecast_stations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wave_forecast_values", force: :cascade do |t|
    t.datetime "date_time"
    t.string "wave_direction"
    t.decimal "wave_height"
    t.bigint "wave_forecast_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wave_forecast_station_id"], name: "index_wave_forecast_values_on_wave_forecast_station_id"
  end

  create_table "weather_forecast_dailies", force: :cascade do |t|
    t.datetime "date_time"
    t.decimal "wind_speed"
    t.string "wind_direction"
    t.decimal "rain_probability"
    t.string "description"
    t.decimal "air_temperature"
    t.decimal "air_temperature_feels_like"
    t.decimal "pressure"
    t.decimal "humidity"
    t.decimal "uv"
    t.bigint "beach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "air_temperature_min"
    t.decimal "air_temperature_max"
    t.string "icon"
    t.index ["beach_id"], name: "index_weather_forecast_dailies_on_beach_id"
  end

  create_table "weather_forecast_values", force: :cascade do |t|
    t.bigint "beach_id", null: false
    t.datetime "date_time"
    t.decimal "rain_probability"
    t.string "wind_direction"
    t.decimal "wind_speed"
    t.decimal "air_temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.decimal "humidity"
    t.decimal "pressure"
    t.decimal "air_temperature_feels_like"
    t.string "icon"
    t.index ["beach_id"], name: "index_weather_forecast_values_on_beach_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buoy_values", "buoy_stations"
  add_foreign_key "cleaning_values", "cleaning_stations"
  add_foreign_key "ocean_forecast_values", "beaches"
  add_foreign_key "real_time_values", "beaches"
  add_foreign_key "reviews", "beaches"
  add_foreign_key "visual_values", "visual_stations"
  add_foreign_key "wave_forecast_values", "wave_forecast_stations"
  add_foreign_key "weather_forecast_dailies", "beaches"
  add_foreign_key "weather_forecast_values", "beaches"
end
