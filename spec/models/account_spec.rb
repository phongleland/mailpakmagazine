# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  password_hash          :string(255)
#  password_salt          :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  account_type_id        :integer
#  disabled               :boolean          default("0")
#  reset_code             :string(255)
#  facebook_user_id       :integer
#  twitter_user_id        :integer
#  token                  :string(255)
#  expires_in             :datetime
#  full_name              :string(255)
#  name                   :string(255)
#  email_business         :boolean          default("1")
#  wcc_id                 :integer
#  auth_token             :string(255)
#  is_owner               :boolean          default("0")
#  notify_contest         :boolean          default("1")
#  notify_coupon          :boolean          default("1")
#  notify_deal            :boolean          default("1")
#  notify_news            :boolean          default("1")
#  zipcode                :string(255)
#  verify                 :string(255)      default("Not Verified")
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

require 'rails_helper'

RSpec.describe Account, type: :model do

  before { @model = FactoryGirl.build(:account) }
  subject { @model }

  it { is_expected.to respond_to(:email) }

end
