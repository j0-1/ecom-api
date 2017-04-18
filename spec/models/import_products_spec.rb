require 'rails_helper'

RSpec.describe ImportProducts, type: :model do
  let(:filename) { mock_file('products.csv') }
  subject { described_class.new(filename) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:filename) }
  end

  describe '#import' do
    it 'succeeds' do
      expect(subject.import).to be_truthy
    end

    it 'imports the correct number of products' do
      expect{ subject.import }.to change{ Product.count }.by(4)
    end
  end
end
