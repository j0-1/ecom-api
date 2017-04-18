require 'rails_helper'

RSpec.describe Variant, type: :model do
  subject { build(:variant) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  context 'associations' do
    it { is_expected.to belong_to(:product) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:style) }
    it { is_expected.to validate_presence_of(:waist) }
    it { is_expected.to validate_presence_of(:length) }
    it { is_expected.to validate_presence_of(:inventory_count) }
    it { is_expected.to validate_numericality_of(:waist) }
    it { is_expected.to validate_numericality_of(:length) }
    it { is_expected.to validate_numericality_of(:inventory_count) }
  end
end
