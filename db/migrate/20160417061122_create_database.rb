class CreateDatabase < ActiveRecord::Migration
  def self.up
    create_table "account_preferences", force: :cascade do |t|
      t.integer  "account_id",     limit: 4
      t.integer  "category_id",    limit: 4
      t.integer  "subcategory_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "account_types", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "accounts", force: :cascade do |t|
      t.string   "email",            limit: 255
      t.string   "password_hash",    limit: 255
      t.string   "password_salt",    limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "account_type_id",  limit: 4
      t.boolean  "disabled",                     default: false
      t.string   "reset_code",       limit: 255
      t.integer  "facebook_user_id", limit: 4
      t.integer  "twitter_user_id",  limit: 4
      t.string   "token",            limit: 255
      t.datetime "expires_in"
      t.string   "full_name",        limit: 255
      t.string   "name",             limit: 255
      t.boolean  "email_business",               default: true
      t.integer  "wcc_id",           limit: 4
      t.string   "auth_token",       limit: 255
      t.boolean  "is_owner",                     default: false
      t.boolean  "notify_contest",               default: true
      t.boolean  "notify_coupon",                default: true
      t.boolean  "notify_deal",                  default: true
      t.boolean  "notify_news",                  default: true
      t.string   "zipcode",          limit: 255
      t.string   "verify",           limit: 255, default: "Not Verified"
    end

    create_table "administrators", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.integer  "account_id",  limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "administrators", ["business_id"], name: "index_administrators_on_business_id", using: :btree

    create_table "appointments", force: :cascade do |t|
      t.integer  "business_id",      limit: 4
      t.integer  "location_id",      limit: 4
      t.date     "appointment_day"
      t.integer  "appointment_time", limit: 4
      t.string   "name",             limit: 255
      t.string   "email",            limit: 255
      t.string   "telephone",        limit: 255
      t.text     "comment",          limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "availabilities", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "availability_days", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "availability_times", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "banner_comments", force: :cascade do |t|
      t.integer  "banner_id",    limit: 4
      t.integer  "account_id",   limit: 4
      t.integer  "reciever_id",  limit: 4
      t.text     "message",      limit: 65535
      t.string   "code",         limit: 255
      t.boolean  "cc",                         default: false
      t.boolean  "notification",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "banner_types", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "banners", force: :cascade do |t|
      t.integer  "business_id",        limit: 4
      t.integer  "clicks_count",       limit: 4,   default: 0
      t.integer  "impressions_count",  limit: 4,   default: 0
      t.boolean  "disabled",                       default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name",    limit: 255
      t.string   "image_content_type", limit: 255
      t.integer  "image_file_size",    limit: 4
      t.datetime "image_updated_at"
      t.integer  "banner_type_id",     limit: 4,   default: 1
      t.string   "redirected_to",      limit: 255
      t.integer  "approver_id",        limit: 4
      t.float    "cost",               limit: 24
      t.integer  "service_id",         limit: 4
      t.integer  "term",               limit: 4
      t.boolean  "require_payment",                default: false
      t.string   "last_action",        limit: 255
      t.string   "profile_id",         limit: 255
    end

    create_table "blog_postings", force: :cascade do |t|
      t.integer  "blog_post_id", limit: 4
      t.integer  "blog_id",      limit: 4
      t.boolean  "posted"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "blog_posts", force: :cascade do |t|
      t.string   "title",       limit: 255
      t.text     "content",     limit: 65535
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "blog_types", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "blogs", force: :cascade do |t|
      t.string   "name",         limit: 255
      t.string   "url",          limit: 255
      t.string   "email",        limit: 255
      t.integer  "blog_type_id", limit: 4
      t.boolean  "display",                  default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "bookmarks", force: :cascade do |t|
      t.integer  "account_id",  limit: 4
      t.integer  "location_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "brochures", force: :cascade do |t|
      t.integer  "business_id",        limit: 4
      t.string   "title",              limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name",    limit: 255
      t.string   "image_content_type", limit: 255
      t.integer  "image_file_size",    limit: 4
      t.datetime "image_updated_at"
    end

    add_index "brochures", ["business_id"], name: "index_brochures_on_business_id", using: :btree

    create_table "businesses", force: :cascade do |t|
      t.string   "name",                            limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "website",                         limit: 255
      t.string   "code",                            limit: 255
      t.string   "url",                             limit: 255
      t.string   "permalink",                       limit: 255
      t.integer  "account_id",                      limit: 4
      t.text     "specialties",                     limit: 65535
      t.text     "history",                         limit: 65535
      t.string   "coupon_image_file_name",          limit: 255
      t.string   "coupon_image_content_type",       limit: 255
      t.integer  "coupon_image_file_size",          limit: 4
      t.datetime "coupon_image_updated_at"
      t.boolean  "disabled",                                      default: false
      t.string   "admin_email",                     limit: 255
      t.boolean  "featured",                                      default: false
      t.string   "logo_file_name",                  limit: 255
      t.string   "logo_content_type",               limit: 255
      t.integer  "logo_file_size",                  limit: 4
      t.datetime "logo_updated_at"
      t.boolean  "smart_phone_disabled",                          default: false
      t.boolean  "reward_disabled",                               default: false
      t.boolean  "logo_cropped",                                  default: false
      t.integer  "wcc_id",                          limit: 4
      t.integer  "position",                        limit: 4
      t.string   "internal_name",                   limit: 255
      t.string   "owner_name",                      limit: 255
      t.string   "billing_address_1",               limit: 255
      t.string   "billing_address_2",               limit: 255
      t.string   "billing_city",                    limit: 255
      t.string   "billing_state",                   limit: 255
      t.string   "billing_zipcode",                 limit: 255
      t.string   "billing_telephone",               limit: 255
      t.string   "billing_fax",                     limit: 255
      t.text     "meta_description",                limit: 65535
      t.text     "meta_keywords",                   limit: 65535
      t.integer  "layout_id",                       limit: 4,     default: 1
      t.integer  "rating",                          limit: 4,     default: 5
      t.text     "product_detail",                  limit: 65535
      t.text     "service_detail",                  limit: 65535
      t.integer  "rating_count",                    limit: 4,     default: 1
      t.string   "tracking_number",                 limit: 255
      t.string   "call_tracking_number",            limit: 255
      t.string   "sms_number",                      limit: 255
      t.string   "call_tracking_forwarding_number", limit: 255
      t.integer  "program_id",                      limit: 4,     default: 1
      t.integer  "region_id",                       limit: 4
      t.string   "order_status",                    limit: 255
      t.integer  "theme_id",                        limit: 4
      t.float    "pricing_enhanced_monthly",        limit: 24,    default: 0.0
      t.float    "pricing_enhanced_yearly",         limit: 24,    default: 0.0
      t.float    "pricing_professional_monthly",    limit: 24,    default: 0.0
      t.float    "pricing_professional_yearly",     limit: 24,    default: 0.0
      t.integer  "version",                         limit: 4,     default: 0
      t.string   "profile_id",                      limit: 255
    end

    add_index "businesses", ["name"], name: "business_name", using: :btree
    add_index "businesses", ["permalink"], name: "index_businesses_on_permalink", using: :btree

    create_table "call_tracks", force: :cascade do |t|
      t.string   "CallGuid",          limit: 255
      t.string   "CallSegmentGuid",   limit: 255
      t.string   "AccountGuid",       limit: 255
      t.string   "AccountSid",        limit: 255
      t.string   "CallSid",           limit: 255
      t.string   "Caller",            limit: 255
      t.string   "CallerZip",         limit: 255
      t.string   "CallerCity",        limit: 255
      t.string   "CallerState",       limit: 255
      t.string   "CallerCountry",     limit: 255
      t.string   "Called",            limit: 255
      t.string   "CalledZip",         limit: 255
      t.string   "CalledCity",        limit: 255
      t.string   "CalledState",       limit: 255
      t.string   "CalledCountry",     limit: 255
      t.string   "CallStatus",        limit: 255
      t.integer  "CallDuration",      limit: 4
      t.integer  "Duration",          limit: 4
      t.string   "ApiVersion",        limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "business_id",       limit: 4
      t.integer  "DialCallDuration",  limit: 4
      t.string   "RecordingUrl",      limit: 255
      t.string   "DialStatus",        limit: 255
      t.string   "FromState",         limit: 255
      t.string   "Direction",         limit: 255
      t.string   "ToState",           limit: 255
      t.string   "FromCity",          limit: 255
      t.string   "From",              limit: 255
      t.string   "FromCountry",       limit: 255
      t.string   "FromZip",           limit: 255
      t.string   "To",                limit: 255
      t.string   "ToCity",            limit: 255
      t.string   "ToCountry",         limit: 255
      t.string   "ToZip",             limit: 255
      t.string   "DialCallSid",       limit: 255
      t.string   "DialCallStatus",    limit: 255
      t.integer  "RecordingDuration", limit: 4
      t.string   "RecordingSid",      limit: 255
      t.integer  "phone_number_id",   limit: 4
    end

    add_index "call_tracks", ["business_id"], name: "index_call_tracks_on_business_id", using: :btree

    create_table "carts", force: :cascade do |t|
      t.datetime "purchased_at"
      t.integer  "business_id",  limit: 4
      t.string   "name",         limit: 255
      t.boolean  "disabled",                 default: true
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "categories", force: :cascade do |t|
      t.string   "name",           limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "permalink",      limit: 255
      t.integer  "display_weight", limit: 4
      t.boolean  "disabled",                   default: false
      t.integer  "version",        limit: 4,   default: 0
      t.string   "map_icon",       limit: 255
    end

    create_table "categorizations", force: :cascade do |t|
      t.integer  "business_id",    limit: 4
      t.integer  "category_id",    limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "subcategory_id", limit: 4
      t.integer  "position",       limit: 4, default: 10000
    end

    add_index "categorizations", ["business_id"], name: "index_categorizations_on_business_id", using: :btree

    create_table "characteristics", force: :cascade do |t|
      t.string   "name",            limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "question_set_id", limit: 4,   default: 1
    end

    create_table "characterizations", force: :cascade do |t|
      t.integer  "characteristic_id", limit: 4
      t.string   "answer",            limit: 255
      t.integer  "business_id",       limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "characterizations", ["business_id"], name: "index_characterizations_on_business_id", using: :btree

    create_table "cities", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "permalink",  limit: 255
      t.integer  "region_id",  limit: 4
      t.integer  "version",    limit: 4,   default: 0
    end

    create_table "citifications", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.integer  "city_id",     limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "citifications", ["business_id"], name: "index_citifications_on_business_id", using: :btree

    create_table "classified_categories", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.string   "permalink",  limit: 255
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "classified_subcategories", force: :cascade do |t|
      t.string   "name",                   limit: 255
      t.integer  "classified_category_id", limit: 4
      t.string   "permalink",              limit: 255
      t.boolean  "disabled",                           default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "count",                  limit: 4,   default: 0
    end

    create_table "classifieds", force: :cascade do |t|
      t.integer  "classified_subcategory_id", limit: 4
      t.integer  "account_id",                limit: 4
      t.string   "title",                     limit: 255
      t.text     "description",               limit: 65535
      t.string   "location",                  limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "picture_file_name",         limit: 255
      t.string   "picture_content_type",      limit: 255
      t.integer  "picture_file_size",         limit: 4
      t.datetime "picture_updated_at"
      t.boolean  "disabled",                                default: false
    end

    create_table "companies", force: :cascade do |t|
      t.string   "name",              limit: 255
      t.string   "address_1",         limit: 255
      t.string   "address_2",         limit: 255
      t.string   "city",              limit: 255
      t.string   "state",             limit: 255
      t.string   "zipcode",           limit: 255
      t.string   "website",           limit: 255
      t.string   "email",             limit: 255
      t.string   "telephone",         limit: 255
      t.string   "fax",               limit: 255
      t.string   "twitter_name",      limit: 255
      t.string   "facebook_name",     limit: 255
      t.string   "logo_file_name",    limit: 255
      t.string   "logo_content_type", limit: 255
      t.integer  "logo_file_size",    limit: 4
      t.datetime "logo_updated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "logo_cropped",                    default: false
      t.text     "meta_description",  limit: 65535
      t.text     "meta_keywords",     limit: 65535
      t.integer  "twitter_user_id",   limit: 4
      t.integer  "facebook_user_id",  limit: 4
      t.boolean  "synced",                          default: false
      t.string   "handle",            limit: 255
      t.string   "time_zone",         limit: 255
      t.string   "tld",               limit: 255
      t.string   "domain",            limit: 255
      t.string   "website_email",     limit: 255
      t.string   "bulk_email",        limit: 255
      t.string   "admin_email",       limit: 255
      t.string   "admin_name",        limit: 255
      t.string   "facebook_id",       limit: 255
      t.string   "facebook_admin",    limit: 255
      t.string   "analytic",          limit: 255
      t.string   "analytic_username", limit: 255
      t.string   "analytic_password", limit: 255
    end

    create_table "contest_locations", force: :cascade do |t|
      t.integer  "contest_id",  limit: 4
      t.integer  "location_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "contest_sponsors", force: :cascade do |t|
      t.integer  "contest_id",  limit: 4
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "contest_winners", force: :cascade do |t|
      t.integer  "contest_id", limit: 4
      t.integer  "account_id", limit: 4
      t.integer  "prize_id",   limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "contests", force: :cascade do |t|
      t.integer  "business_id",       limit: 4
      t.date     "start_date"
      t.date     "end_date"
      t.string   "title",             limit: 255
      t.text     "description",       limit: 65535
      t.integer  "winner_id",         limit: 4
      t.integer  "page_view",         limit: 4,     default: 0
      t.string   "permalink",         limit: 255
      t.boolean  "disabled",                        default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "published",                       default: false
      t.float    "original_value",    limit: 24
      t.integer  "threshold_count",   limit: 4
      t.integer  "current_count",     limit: 4
      t.text     "conditions",        limit: 65535
      t.text     "highlights",        limit: 65535
      t.date     "expires"
      t.string   "logo_file_name",    limit: 255
      t.string   "logo_content_type", limit: 255
      t.integer  "logo_file_size",    limit: 4
      t.datetime "logo_updated_at"
      t.boolean  "logo_cropped",                    default: false
      t.boolean  "allow_multiple",                  default: false
      t.integer  "winners",           limit: 4,     default: 1
    end

    create_table "country_states", force: :cascade do |t|
      t.string   "state_abbr",   limit: 255
      t.string   "state_full",   limit: 255
      t.string   "country_code", limit: 255
      t.string   "country_full", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "coupons", force: :cascade do |t|
      t.string   "offer",                limit: 255
      t.integer  "expires",              limit: 4
      t.integer  "business_id",          limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "criteria_id",          limit: 4
      t.integer  "availability_time_id", limit: 4
      t.boolean  "disabled",                         default: false
    end

    create_table "criterias", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.integer  "followers",  limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "customers", force: :cascade do |t|
      t.string   "name",         limit: 255
      t.string   "email",        limit: 255
      t.string   "mobile_phone", limit: 255
      t.string   "address_1",    limit: 255
      t.string   "address_2",    limit: 255
      t.string   "city",         limit: 255
      t.string   "state",        limit: 255
      t.string   "zipcode",      limit: 255
      t.integer  "business_id",  limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "deal_certificates", force: :cascade do |t|
      t.integer  "deal_order_id", limit: 4
      t.string   "code",          limit: 255
      t.boolean  "redeemed",                  default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "deal_locations", force: :cascade do |t|
      t.integer  "deal_id",     limit: 4
      t.integer  "location_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "deal_order_transactions", force: :cascade do |t|
      t.integer  "deal_order_id", limit: 4
      t.string   "action",        limit: 255
      t.integer  "amount",        limit: 4
      t.boolean  "success"
      t.string   "authorization", limit: 255
      t.string   "message",       limit: 255
      t.text     "params",        limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "deal_orders", force: :cascade do |t|
      t.integer  "deal_id",         limit: 4
      t.integer  "quantity",        limit: 4
      t.string   "ip_address",      limit: 255
      t.string   "first_name",      limit: 255
      t.string   "last_name",       limit: 255
      t.string   "card_type",       limit: 255
      t.date     "card_expires_on"
      t.datetime "purchased_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "address_1",       limit: 255
      t.string   "address_2",       limit: 255
      t.string   "city",            limit: 255
      t.string   "state",           limit: 255
      t.string   "zipcode",         limit: 255
      t.integer  "account_id",      limit: 4
      t.text     "params",          limit: 65535
      t.string   "code",            limit: 255
      t.boolean  "succeed"
    end

    create_table "deals", force: :cascade do |t|
      t.integer  "business_id",       limit: 4
      t.date     "start_date"
      t.date     "end_date"
      t.float    "original_value",    limit: 24
      t.float    "deal_value",        limit: 24
      t.integer  "threshold_count",   limit: 4,     default: 10
      t.integer  "current_count",     limit: 4,     default: 0
      t.integer  "page_view",         limit: 4,     default: 0
      t.string   "title",             limit: 255
      t.text     "description",       limit: 65535
      t.string   "permalink",         limit: 255
      t.boolean  "disabled",                        default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "published",                       default: false
      t.integer  "max_count",         limit: 4
      t.text     "conditions",        limit: 65535
      t.text     "highlights",        limit: 65535
      t.date     "expires"
      t.string   "logo_file_name",    limit: 255
      t.string   "logo_content_type", limit: 255
      t.integer  "logo_file_size",    limit: 4
      t.datetime "logo_updated_at"
      t.boolean  "logo_cropped",                    default: false
    end

    create_table "email_addresses", force: :cascade do |t|
      t.string   "address",     limit: 255
      t.string   "sender_name", limit: 255
      t.text     "message",     limit: 65535
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "email_campaign_recipients", force: :cascade do |t|
      t.integer  "email_campaign_id", limit: 4
      t.string   "email",             limit: 255
      t.string   "code",              limit: 255
      t.boolean  "sent",                          default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "email_campaign_recipients", ["code"], name: "index_email_campaign_recipients_on_code", using: :btree
    add_index "email_campaign_recipients", ["email_campaign_id"], name: "index_email_campaign_recipients_on_email_campaign_id", using: :btree

    create_table "email_campaign_responses", force: :cascade do |t|
      t.integer  "email_campaign_id", limit: 4
      t.string   "user_email",        limit: 255
      t.boolean  "opt_out",                       default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "email_campaign_types", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "email_campaigns", force: :cascade do |t|
      t.integer  "email_campaign_type_id", limit: 4
      t.integer  "model_id",               limit: 4
      t.string   "status",                 limit: 255
      t.integer  "total_sent",             limit: 4
      t.integer  "total_response",         limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title",                  limit: 255
      t.boolean  "businesses",                         default: false
      t.boolean  "users",                              default: false
      t.boolean  "whitelist",                          default: false
    end

    create_table "email_general_campaigns", force: :cascade do |t|
      t.text     "description",       limit: 65535
      t.integer  "email_campaign_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "email_mailing_campaigns", force: :cascade do |t|
      t.integer  "email_campaign_id", limit: 4
      t.integer  "mailing_id",        limit: 4
      t.integer  "mailing_order_id",  limit: 4
      t.string   "title",             limit: 255
      t.text     "description",       limit: 65535
      t.string   "size",              limit: 255,   default: "half"
      t.integer  "position",          limit: 4,     default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "email_sents", force: :cascade do |t|
      t.integer  "email_id",        limit: 4
      t.string   "recipient",       limit: 255
      t.string   "code",            limit: 255
      t.string   "sent_status",     limit: 255
      t.string   "response_status", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "emails", force: :cascade do |t|
      t.string   "title",          limit: 255
      t.text     "message",        limit: 65535
      t.integer  "sender_id",      limit: 4
      t.string   "recipient_type", limit: 255
      t.integer  "model_id",       limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "model_type",     limit: 255
      t.integer  "template_id",    limit: 4
    end

    create_table "entrants", force: :cascade do |t|
      t.integer  "contest_id", limit: 4
      t.integer  "account_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "facebook_users", force: :cascade do |t|
      t.string   "facebook_id",         limit: 255
      t.string   "name",                limit: 255
      t.string   "first_name",          limit: 255
      t.string   "last_name",           limit: 255
      t.string   "link",                limit: 255
      t.string   "birthday",            limit: 255
      t.string   "gender",              limit: 255
      t.string   "relationship_status", limit: 255
      t.string   "political",           limit: 255
      t.integer  "timezone",            limit: 4
      t.string   "locale",              limit: 255
      t.boolean  "verified"
      t.datetime "updated_time"
      t.string   "token",               limit: 255
      t.string   "refresh_token",       limit: 255
      t.datetime "expires_in"
      t.datetime "expires_at"
      t.integer  "friends_count",       limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "feebacks", force: :cascade do |t|
      t.integer  "yoopon_id",  limit: 4
      t.text     "problem",    limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "freebie_sents", force: :cascade do |t|
      t.integer  "freebie_id",  limit: 4
      t.text     "message",     limit: 65535
      t.integer  "sender_id",   limit: 4
      t.integer  "reciever_id", limit: 4
      t.string   "code",        limit: 255
      t.boolean  "redeemed",                  default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "freebies", force: :cascade do |t|
      t.integer  "business_id",      limit: 4
      t.text     "offer",            limit: 65535
      t.text     "terms_conditions", limit: 65535
      t.boolean  "disabled",                       default: false
      t.integer  "given",            limit: 4,     default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "freebies", ["business_id"], name: "index_freebies_on_business_id", using: :btree

    create_table "friendships", force: :cascade do |t|
      t.integer  "user_id",    limit: 4
      t.integer  "friend_id",  limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "layouts", force: :cascade do |t|
      t.string   "name",         limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "file_name",    limit: 255
      t.text     "description",  limit: 65535
      t.boolean  "standard",                   default: false
      t.boolean  "enhanced",                   default: true
      t.boolean  "professional",               default: true
    end

    create_table "leads", force: :cascade do |t|
      t.string   "name",        limit: 255
      t.string   "email",       limit: 255
      t.string   "telephone",   limit: 255
      t.text     "comment",     limit: 65535
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "leads", ["business_id"], name: "index_leads_on_business_id", using: :btree

    create_table "locations", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.string   "address_1",   limit: 255
      t.string   "address_2",   limit: 255
      t.string   "city",        limit: 255
      t.string   "state",       limit: 255
      t.string   "zipcode",     limit: 255
      t.float    "longitude",   limit: 24
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "telephone",   limit: 255
      t.float    "latitude",    limit: 24
      t.string   "precision",   limit: 255
      t.boolean  "disabled",                default: false
    end

    add_index "locations", ["business_id"], name: "index_locations_on_business_id", using: :btree

    create_table "login_tokens", force: :cascade do |t|
      t.integer  "account_id", limit: 4
      t.string   "token",      limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "logs", force: :cascade do |t|
      t.integer  "account_id",       limit: 4
      t.integer  "mailing_id",       limit: 4
      t.integer  "mailing_order_id", limit: 4
      t.string   "ip_address",       limit: 255
      t.text     "message",          limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "ma_comments", force: :cascade do |t|
      t.integer  "account_id", limit: 4
      t.integer  "mailing_id", limit: 4
      t.text     "message",    limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "magazine_layouts", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.integer  "sections",   limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "magazine_pages", force: :cascade do |t|
      t.integer  "mailing_zone_id",    limit: 4
      t.integer  "page_number",        limit: 4
      t.integer  "magazine_layout_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "mailing_lists", force: :cascade do |t|
      t.string   "email",          limit: 255
      t.string   "f_name",         limit: 255
      t.string   "l_name",         limit: 255
      t.string   "address",        limit: 255
      t.string   "city",           limit: 255
      t.string   "county",         limit: 255
      t.string   "state",          limit: 255
      t.string   "zip",            limit: 255
      t.string   "source",         limit: 255
      t.string   "phone",          limit: 255
      t.string   "gender",         limit: 255
      t.string   "dob",            limit: 255
      t.string   "datetime",       limit: 255
      t.string   "ethnicity",      limit: 255
      t.string   "ownrent",        limit: 255
      t.string   "domain",         limit: 255
      t.float    "latitude",       limit: 24
      t.float    "longitude",      limit: 24
      t.string   "country",        limit: 255
      t.integer  "income",         limit: 4
      t.integer  "householdvalue", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "mailing_orders", force: :cascade do |t|
      t.integer  "mailing_id",               limit: 4
      t.string   "name",                     limit: 255
      t.integer  "business_id",              limit: 4
      t.integer  "order_dimension_id",       limit: 4
      t.integer  "order_paper_id",           limit: 4
      t.integer  "order_color_id",           limit: 4
      t.integer  "po_quantity",              limit: 4,     default: 0
      t.integer  "order_status_id",          limit: 4,     default: 1
      t.boolean  "disabled",                               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "coupon_file_file_name",    limit: 255
      t.string   "coupon_file_content_type", limit: 255
      t.integer  "coupon_file_file_size",    limit: 4
      t.datetime "coupon_file_updated_at"
      t.integer  "sales_rep_id",             limit: 4
      t.integer  "designer_id",              limit: 4
      t.integer  "approver_id",              limit: 4
      t.boolean  "approvable",                             default: false
      t.boolean  "printed",                                default: false
      t.text     "message",                  limit: 65535
      t.float    "coupon_file_width",        limit: 24,    default: 0.0
      t.float    "coupon_file_height",       limit: 24,    default: 0.0
      t.integer  "coupon_file_page_count",   limit: 4,     default: 0
      t.integer  "wcc_id",                   limit: 4
      t.boolean  "display",                                default: true
      t.integer  "pixel_width",              limit: 4
      t.integer  "pixel_height",             limit: 4
      t.boolean  "vertical",                               default: false
      t.string   "last_action",              limit: 255
      t.date     "expires"
      t.text     "meta_description",         limit: 65535
      t.float    "cost",                     limit: 24,    default: 0.0
      t.boolean  "is_rotated",                             default: false
      t.boolean  "processing"
      t.boolean  "require_payment",                        default: false
      t.integer  "order_transaction_id",     limit: 4
      t.integer  "print_count",              limit: 4,     default: 0
    end

    add_index "mailing_orders", ["business_id"], name: "index_mailing_orders_on_business_id", using: :btree
    add_index "mailing_orders", ["mailing_id"], name: "index_mailing_orders_on_mailing_id", using: :btree

    create_table "mailing_zone_orders", force: :cascade do |t|
      t.integer  "mailing_zone_id",  limit: 4
      t.integer  "mailing_order_id", limit: 4
      t.integer  "position",         limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "section",          limit: 4, default: 0
      t.integer  "magazine_page_id", limit: 4
    end

    create_table "mailing_zone_types", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "mailing_zones", force: :cascade do |t|
      t.integer  "mailing_id",                 limit: 4
      t.integer  "zone_id",                    limit: 4
      t.integer  "count",                      limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "envelope_file_file_name",    limit: 255
      t.string   "envelope_file_content_type", limit: 255
      t.integer  "envelope_file_file_size",    limit: 4
      t.datetime "envelope_file_updated_at"
      t.integer  "mailing_zone_type_id",       limit: 4,   default: 1
      t.string   "name",                       limit: 255
      t.integer  "approver_id",                limit: 4
      t.integer  "pages",                      limit: 4,   default: 0
      t.integer  "order_dimension_id",         limit: 4
      t.integer  "position",                   limit: 4,   default: 0
      t.integer  "mailing_zone_orders_count",  limit: 4,   default: 0
    end

    add_index "mailing_zones", ["mailing_id"], name: "index_mailing_zones_on_mailing_id", using: :btree

    create_table "mailings", force: :cascade do |t|
      t.date     "mailing_date"
      t.string   "name",                 limit: 255
      t.boolean  "disabled",                         default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "approver_id",          limit: 4
      t.integer  "wcc_id",               limit: 4
      t.boolean  "featured",                         default: false
      t.boolean  "twitter"
      t.boolean  "facebook"
      t.date     "default_expiration"
      t.integer  "mailing_orders_count", limit: 4,   default: 0
      t.integer  "mailing_zones_count",  limit: 4,   default: 0
      t.integer  "printer_id",           limit: 4
    end

    create_table "merge_orders", force: :cascade do |t|
      t.integer  "business_id",      limit: 4
      t.integer  "mailing_order_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "merges", force: :cascade do |t|
      t.integer  "new_business_id", limit: 4
      t.integer  "old_business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "messages", force: :cascade do |t|
      t.integer  "account_id",    limit: 4
      t.string   "FromState",     limit: 255
      t.string   "ToState",       limit: 255
      t.string   "SmsMessageSid", limit: 255
      t.string   "AccountSid",    limit: 255
      t.string   "Body",          limit: 255
      t.string   "FromCity",      limit: 255
      t.string   "From",          limit: 255
      t.string   "SmsStatus",     limit: 255
      t.string   "To",            limit: 255
      t.string   "FromCountry",   limit: 255
      t.string   "FromZip",       limit: 255
      t.string   "ToCity",        limit: 255
      t.string   "ApiVersion",    limit: 255
      t.string   "ToCountry",     limit: 255
      t.string   "ToZip",         limit: 255
      t.string   "SmsSid",        limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "yoopon_id",     limit: 4
    end

    create_table "mo_comments", force: :cascade do |t|
      t.integer  "mailing_order_id", limit: 4
      t.integer  "account_id",       limit: 4
      t.integer  "reciever_id",      limit: 4
      t.text     "message",          limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "code",             limit: 255
      t.boolean  "cc",                             default: false
      t.boolean  "notification",                   default: false
    end

    create_table "mz_comments", force: :cascade do |t|
      t.integer  "mailing_zone_id", limit: 4
      t.integer  "account_id",      limit: 4
      t.integer  "reciever_id",     limit: 4
      t.text     "message",         limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "online_coupons", force: :cascade do |t|
      t.integer  "business_id",      limit: 4
      t.string   "offer",            limit: 255
      t.integer  "expires_term",     limit: 4
      t.boolean  "disabled",                       default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "terms_conditions", limit: 65535
      t.date     "expires"
      t.boolean  "campus_offer",                   default: false
    end

    add_index "online_coupons", ["business_id"], name: "index_online_coupons_on_business_id", using: :btree

    create_table "operating_hours", force: :cascade do |t|
      t.integer  "day",         limit: 4
      t.integer  "open",        limit: 4
      t.integer  "close",       limit: 4
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "closed",                default: false
      t.integer  "location_id", limit: 4
      t.integer  "status",      limit: 4
    end

    add_index "operating_hours", ["location_id"], name: "index_operating_hours_on_location_id", using: :btree

    create_table "order_colors", force: :cascade do |t|
      t.string   "name",            limit: 255
      t.integer  "number_of_pages", limit: 4
      t.boolean  "disabled",                    default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "wcc_id",          limit: 4
    end

    create_table "order_dimensions", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.float    "width",      limit: 24
      t.float    "height",     limit: 24
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "wcc_id",     limit: 4
      t.integer  "position",   limit: 4,   default: 1000
    end

    create_table "order_papers", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.integer  "weight",     limit: 4
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "wcc_id",     limit: 255
    end

    create_table "order_statuses", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "order_transactions", force: :cascade do |t|
      t.integer  "order_id",      limit: 4
      t.string   "action",        limit: 255
      t.integer  "amount",        limit: 4
      t.boolean  "success"
      t.string   "authorization", limit: 255
      t.string   "message",       limit: 255
      t.text     "params",        limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "profile_id",    limit: 255
    end

    create_table "orders", force: :cascade do |t|
      t.integer  "cart_id",                    limit: 4
      t.string   "ip_address",                 limit: 255
      t.string   "first_name",                 limit: 255
      t.string   "last_name",                  limit: 255
      t.string   "card_type",                  limit: 255
      t.date     "card_expires_on"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "business_id",                limit: 4
      t.integer  "service_id",                 limit: 4
      t.string   "profileId",                  limit: 255
      t.text     "params",                     limit: 65535
      t.string   "status",                     limit: 255,   default: "Processing"
      t.string   "address_1",                  limit: 255
      t.string   "address_2",                  limit: 255
      t.string   "city",                       limit: 255
      t.string   "state",                      limit: 255
      t.string   "zipcode",                    limit: 255
      t.string   "telephone",                  limit: 255
      t.string   "fax",                        limit: 255
      t.string   "email",                      limit: 255
      t.integer  "phone_number_id",            limit: 4
      t.integer  "account_id",                 limit: 4
      t.text     "agreement",                  limit: 65535
      t.integer  "initial_amount",             limit: 4
      t.integer  "trial_amount",               limit: 4
      t.string   "trial_periodicity",          limit: 255
      t.integer  "trial_total_billing_cycles", limit: 4
      t.integer  "recurring_amount",           limit: 4
      t.string   "recurring_periodicity",      limit: 255
      t.integer  "term",                       limit: 4,     default: 0
    end

    create_table "pages", force: :cascade do |t|
      t.string   "name",         limit: 255
      t.string   "permalink",    limit: 255
      t.text     "content",      limit: 65535
      t.integer  "franchise_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "payment_notifications", force: :cascade do |t|
      t.text     "params",         limit: 65535
      t.integer  "cart_id",        limit: 4
      t.string   "status",         limit: 255
      t.string   "transaction_id", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "permalinks", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.string   "permalink",   limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "permalinks", ["permalink"], name: "index_permalinks_on_permalink", using: :btree

    create_table "phone_numbers", force: :cascade do |t|
      t.integer  "business_id",            limit: 4
      t.string   "call_forwarding_number", limit: 255
      t.string   "sms_forwarding_number",  limit: 255
      t.string   "sms_forwarding_email",   limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "number",                 limit: 255
      t.string   "name",                   limit: 255
      t.boolean  "forward_reply",                      default: true
      t.date     "card_expires_on"
    end

    add_index "phone_numbers", ["business_id"], name: "index_phone_numbers_on_business_id", using: :btree

    create_table "photos", force: :cascade do |t|
      t.integer  "business_id",        limit: 4
      t.string   "name",               limit: 255
      t.text     "description",        limit: 65535
      t.string   "image_file_name",    limit: 255
      t.string   "image_content_type", limit: 255
      t.integer  "image_file_size",    limit: 4
      t.datetime "image_updated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "photos", ["business_id"], name: "index_photos_on_business_id", using: :btree

    create_table "possible_answers", force: :cascade do |t|
      t.integer  "characteristic_id", limit: 4
      t.string   "answer",            limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "printers", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.string   "email",      limit: 255
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "prizes", force: :cascade do |t|
      t.integer  "contest_id",   limit: 4
      t.integer  "name",         limit: 4
      t.text     "description",  limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title",        limit: 255
      t.float    "value",        limit: 24
      t.date     "drawing_date"
    end

    create_table "programs", force: :cascade do |t|
      t.string   "name",           limit: 255
      t.boolean  "logo",                       default: true
      t.integer  "locations",      limit: 4,   default: 1
      t.integer  "weblinks",       limit: 4,   default: 1
      t.integer  "downloadables",  limit: 4,   default: 1
      t.integer  "testimonials",   limit: 4,   default: 1
      t.boolean  "review",                     default: false
      t.boolean  "design_coupons",             default: true
      t.integer  "online_coupons", limit: 4,   default: 0
      t.integer  "photos",         limit: 4,   default: 0
      t.integer  "videos",         limit: 4,   default: 0
      t.integer  "tags",           limit: 4,   default: 0
      t.integer  "cities",         limit: 4,   default: 1
      t.integer  "zipcodes",       limit: 4,   default: 1
      t.float    "cost",           limit: 24,  default: 29.99
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "question_sets", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "ratings", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.integer  "stars",       limit: 4
      t.integer  "account_id",  limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "regions", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.string   "permalink",  limit: 255
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "requests", force: :cascade do |t|
      t.integer  "account_id", limit: 4
      t.string   "name",       limit: 255
      t.boolean  "notify"
      t.text     "comment",    limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "address",    limit: 255
    end

    create_table "reviews", force: :cascade do |t|
      t.integer  "business_id",     limit: 4
      t.integer  "account_id",      limit: 4
      t.text     "message",         limit: 65535
      t.boolean  "approved",                      default: false
      t.integer  "approver_id",     limit: 4
      t.boolean  "disabled",                      default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "rating",          limit: 4,     default: 5
      t.integer  "freebie_sent_id", limit: 4
    end

    add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree

    create_table "rewards", force: :cascade do |t|
      t.integer  "business_id",  limit: 4
      t.integer  "review_count", limit: 4
      t.text     "offer",        limit: 65535
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "disabled",                   default: false
    end

    create_table "service_types", force: :cascade do |t|
      t.string   "name",         limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "billing_type", limit: 255
    end

    create_table "services", force: :cascade do |t|
      t.text     "description",                limit: 65535
      t.integer  "initial_amount",             limit: 4
      t.integer  "trial_amount",               limit: 4
      t.string   "trial_periodicity",          limit: 255
      t.integer  "trial_total_billing_cycles", limit: 4
      t.integer  "recurring_amount",           limit: 4
      t.string   "recurring_periodicity",      limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "service_type_id",            limit: 4
      t.text     "agreement",                  limit: 65535
      t.integer  "term",                       limit: 4,     default: 0
    end

    create_table "session_types", force: :cascade do |t|
      t.string   "key",          limit: 255, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "time_to_live", limit: 4,   null: false
    end

    add_index "session_types", ["key"], name: "session_types_uk1", unique: true, using: :btree

    create_table "sessions", force: :cascade do |t|
      t.string   "sid",             limit: 255, null: false
      t.integer  "account_id",      limit: 4,   null: false
      t.integer  "session_type_id", limit: 4,   null: false
      t.datetime "expires_at",                  null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "sessions", ["sid"], name: "sessions_uk1", unique: true, using: :btree

    create_table "slogans", force: :cascade do |t|
      t.string   "name",        limit: 255
      t.integer  "business_id", limit: 4
      t.boolean  "disabled",                default: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "sms_messages", force: :cascade do |t|
      t.string   "title",       limit: 255
      t.string   "message",     limit: 255
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "sms_reminders", force: :cascade do |t|
      t.integer  "business_id",     limit: 4
      t.integer  "sms_message_id",  limit: 4
      t.integer  "customer_id",     limit: 4
      t.date     "date_sent"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "status",          limit: 255, default: "Not Sent"
      t.integer  "phone_number_id", limit: 4
      t.integer  "open",            limit: 4
      t.integer  "close",           limit: 4
    end

    add_index "sms_reminders", ["business_id"], name: "index_sms_reminders_on_business_id", using: :btree

    create_table "sms_tracks", force: :cascade do |t|
      t.integer  "business_id",     limit: 4
      t.integer  "phone_number_id", limit: 4
      t.string   "FromState",       limit: 255
      t.string   "ToState",         limit: 255
      t.string   "AccountSid",      limit: 255
      t.string   "Body",            limit: 255
      t.string   "SmsMessageSid",   limit: 255
      t.string   "FromCity",        limit: 255
      t.string   "From",            limit: 255
      t.string   "SmsStatus",       limit: 255
      t.string   "To",              limit: 255
      t.string   "FromCountry",     limit: 255
      t.string   "FromZip",         limit: 255
      t.string   "ToCity",          limit: 255
      t.string   "ToZip",           limit: 255
      t.string   "ToCountry",       limit: 255
      t.string   "SmsSid",          limit: 255
      t.string   "ApiVersion",      limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "sms_tracks", ["business_id"], name: "index_sms_tracks_on_business_id", using: :btree

    create_table "subcategories", force: :cascade do |t|
      t.string   "name",        limit: 255
      t.integer  "category_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "permalink",   limit: 255
      t.integer  "version",     limit: 4,   default: 0
      t.string   "map_icon",    limit: 255
    end

    create_table "subscribers", force: :cascade do |t|
      t.string   "email",       limit: 255
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "templates", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "testimonials", force: :cascade do |t|
      t.integer  "business_id",  limit: 4
      t.text     "message",      limit: 65535
      t.string   "client_name",  limit: 255
      t.string   "organization", limit: 255
      t.date     "date_given"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "testimonials", ["business_id"], name: "index_testimonials_on_business_id", using: :btree

    create_table "themes", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.string   "permalink",  limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "toolifications", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.integer  "tool_id",     limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "tools", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "twitter_posts", force: :cascade do |t|
      t.string   "message",     limit: 255
      t.string   "url",         limit: 255
      t.integer  "business_id", limit: 4
      t.integer  "result",      limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "twitter_users", force: :cascade do |t|
      t.string   "twitter_id",                   limit: 255
      t.string   "login",                        limit: 255
      t.string   "access_token",                 limit: 255
      t.string   "access_secret",                limit: 255
      t.string   "remember_token",               limit: 255
      t.datetime "remember_token_expires_at"
      t.string   "name",                         limit: 255
      t.string   "location",                     limit: 255
      t.string   "description",                  limit: 255
      t.string   "profile_image_url",            limit: 255
      t.string   "url",                          limit: 255
      t.boolean  "protected"
      t.string   "profile_background_color",     limit: 255
      t.string   "profile_sidebar_fill_color",   limit: 255
      t.string   "profile_link_color",           limit: 255
      t.string   "profile_sidebar_border_color", limit: 255
      t.string   "profile_text_color",           limit: 255
      t.string   "profile_background_image_url", limit: 255
      t.boolean  "profile_background_tile"
      t.integer  "friends_count",                limit: 4
      t.integer  "statuses_count",               limit: 4
      t.integer  "followers_count",              limit: 4
      t.integer  "favourites_count",             limit: 4
      t.integer  "utc_offset",                   limit: 4
      t.string   "time_zone",                    limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "validations", force: :cascade do |t|
      t.string   "secret",       limit: 255
      t.string   "code",         limit: 255
      t.string   "phone_number", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "videos", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.string   "title",       limit: 255
      t.string   "url",         limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "videos", ["business_id"], name: "index_videos_on_business_id", using: :btree

    create_table "weblinks", force: :cascade do |t|
      t.string   "title",       limit: 255
      t.string   "url",         limit: 255
      t.integer  "business_id", limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "weblinks", ["business_id"], name: "index_weblinks_on_business_id", using: :btree

    create_table "whitelists", force: :cascade do |t|
      t.string   "email",      limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "yoopon_post_logs", force: :cascade do |t|
      t.integer  "yoopon_id",  limit: 4,   null: false
      t.string   "network",    limit: 255, null: false
      t.integer  "result",     limit: 4,   null: false
      t.string   "response",   limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "yoopon_post_logs", ["yoopon_id"], name: "yoopon_post_logs_ix1", using: :btree

    create_table "yoopons", force: :cascade do |t|
      t.integer  "account_id",   limit: 4
      t.integer  "coupon_id",    limit: 4
      t.string   "code",         limit: 255
      t.datetime "expires"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "review",       limit: 65535
      t.integer  "location_id",  limit: 4
      t.boolean  "disabled",                   default: false
      t.integer  "status",       limit: 4,     default: 0,     null: false
      t.integer  "rejected_by",  limit: 4
      t.integer  "error_status", limit: 4
      t.integer  "hits",         limit: 4,     default: 0
    end

    add_index "yoopons", ["status"], name: "yoopons_ix1", using: :btree

    create_table "zipcodes", force: :cascade do |t|
      t.string   "zip",             limit: 255
      t.string   "city",            limit: 255
      t.string   "state_abbr",      limit: 255
      t.string   "state_full",      limit: 255
      t.string   "country_code",    limit: 255
      t.string   "country_full",    limit: 255
      t.float    "latitude",        limit: 24
      t.float    "longitude",       limit: 24
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "nearby_zipcodes", limit: 65535
      t.text     "nearby_cities",   limit: 65535
    end

    create_table "zipifications", force: :cascade do |t|
      t.integer  "business_id", limit: 4
      t.string   "zip",         limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "zones", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.integer  "count",      limit: 4
      t.boolean  "disabled",               default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "wcc_id",     limit: 4
      t.integer  "position",   limit: 4,   default: 0
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
    # use rake db:drop db:create db:migrate
  end
end
