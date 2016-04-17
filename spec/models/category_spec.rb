# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  permalink      :string(255)
#  display_weight :integer
#  disabled       :boolean          default("0")
#  version        :integer          default("0")
#  map_icon       :string(255)
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  before { @model = FactoryGirl.build(:category) }
  subject { @model }

  it_behaves_like "an object with attributes", [ :name, :permalink ]

end
