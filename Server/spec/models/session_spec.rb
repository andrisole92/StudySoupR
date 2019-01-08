require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Session, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_many :messages}

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }
end