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

ActiveRecord::Schema.define(version: 20161215202255) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "author"
    t.string   "author_email"
    t.string   "author_url"
    t.string   "author_IP"
    t.text     "content",        limit: 65535
    t.string   "approved",                     default: "pending"
    t.string   "agent"
    t.string   "typee"
    t.integer  "comment_parent"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["approved"], name: "index_comments_on_approved", using: :btree
    t.index ["comment_parent"], name: "index_comments_on_comment_parent", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "custom_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "object_class"
    t.string  "name"
    t.string  "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count",                      default: 0
    t.boolean "is_repeat",                  default: false
    t.text    "description",  limit: 65535
    t.string  "status"
    t.index ["object_class"], name: "index_custom_fields_on_object_class", using: :btree
    t.index ["objectid"], name: "index_custom_fields_on_objectid", using: :btree
    t.index ["parent_id"], name: "index_custom_fields_on_parent_id", using: :btree
    t.index ["slug"], name: "index_custom_fields_on_slug", using: :btree
  end

  create_table "custom_fields_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string  "object_class"
    t.text    "value",             limit: 4294967295
    t.string  "custom_field_slug"
    t.integer "group_number",                         default: 0
    t.index ["custom_field_id"], name: "index_custom_fields_relationships_on_custom_field_id", using: :btree
    t.index ["custom_field_slug"], name: "index_custom_fields_relationships_on_custom_field_slug", using: :btree
    t.index ["object_class"], name: "index_custom_fields_relationships_on_object_class", using: :btree
    t.index ["objectid"], name: "index_custom_fields_relationships_on_objectid", using: :btree
  end

  create_table "metas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "key"
    t.text    "value",        limit: 4294967295
    t.integer "objectid"
    t.string  "object_class"
    t.index ["key"], name: "index_metas_on_key", using: :btree
    t.index ["object_class"], name: "index_metas_on_object_class", using: :btree
    t.index ["objectid"], name: "index_metas_on_objectid", using: :btree
  end

  create_table "plugins_contact_forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "site_id"
    t.integer  "count"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "slug"
    t.text     "description", limit: 65535
    t.text     "value",       limit: 65535
    t.text     "settings",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content",          limit: 4294967295
    t.text     "content_filtered", limit: 4294967295
    t.string   "status",                              default: "published"
    t.datetime "published_at"
    t.integer  "post_parent"
    t.string   "visibility",                          default: "public"
    t.text     "visibility_value", limit: 65535
    t.string   "post_class",                          default: "Post"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "user_id"
    t.integer  "post_order",                          default: 0
    t.integer  "taxonomy_id"
    t.boolean  "is_feature",                          default: false
    t.index ["post_class"], name: "index_posts_on_post_class", using: :btree
    t.index ["post_parent"], name: "index_posts_on_post_parent", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", using: :btree
    t.index ["status"], name: "index_posts_on_status", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "term_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
    t.index ["objectid"], name: "index_term_relationships_on_objectid", using: :btree
    t.index ["term_order"], name: "index_term_relationships_on_term_order", using: :btree
    t.index ["term_taxonomy_id"], name: "index_term_relationships_on_term_taxonomy_id", using: :btree
  end

  create_table "term_taxonomy", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "taxonomy"
    t.text     "description", limit: 4294967295
    t.integer  "parent_id"
    t.integer  "count"
    t.string   "name"
    t.string   "slug"
    t.integer  "term_group"
    t.integer  "term_order"
    t.string   "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.index ["parent_id"], name: "index_term_taxonomy_on_parent_id", using: :btree
    t.index ["slug"], name: "index_term_taxonomy_on_slug", using: :btree
    t.index ["taxonomy"], name: "index_term_taxonomy_on_taxonomy", using: :btree
    t.index ["term_order"], name: "index_term_taxonomy_on_term_order", using: :btree
    t.index ["user_id"], name: "index_term_taxonomy_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "role",                   default: "client"
    t.string   "email"
    t.string   "slug"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.integer  "parent_id"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "site_id",                default: -1
    t.string   "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean  "is_valid_email",         default: true
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["role"], name: "index_users_on_role", using: :btree
    t.index ["site_id"], name: "index_users_on_site_id", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
