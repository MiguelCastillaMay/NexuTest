require 'rails_helper'

RSpec.describe Model, type: :model do
  it { should belong_to(:brand) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:average_price).only_integer.is_greater_than_or_equal_to(100000) }
end
