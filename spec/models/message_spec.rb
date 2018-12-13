require 'rails_helper'

# Test suite for the Item model
RSpec.describe Message, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to belong_to(:session).with_foreign_key(:sId)}
  it { should validate_presence_of(:body) }
end