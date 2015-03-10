ActiveRecord::Schema.define(version: 20150308121556) do

  create_table "news", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
