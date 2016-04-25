require 'rails_helper'

RSpec.describe "activeadmin resources" do

  before { @model_names = ActiveAdmin.application.namespaces[:admin].resources.keys.map{|item| item.name}}
  subject { @model_names }

  # Defaults
  %w(AdminUser AdminComment Dashboard).each do |className|
    it { is_expected.to include(className) }
  end
  # Custom
  %w(AccountType Category).each do |className|
    it { is_expected.to include(className) }
  end
end