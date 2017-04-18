require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { build(:image) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  context 'associations' do
    it { is_expected.to belong_to(:product) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end
end
