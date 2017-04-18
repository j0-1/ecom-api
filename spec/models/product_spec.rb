require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  context 'associations' do
    it { is_expected.to have_many(:images).dependent(:destroy) }
    it { is_expected.to have_many(:variants).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
