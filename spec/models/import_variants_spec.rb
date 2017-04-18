require 'rails_helper'

RSpec.describe ImportVariants, type: :model do
  let(:products_filename) { mock_file('products.csv') }
  let(:import_products) { ImportProducts.new(products_filename) }
  let(:filename) { mock_file('inventory.csv') }
  subject { described_class.new(filename) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:filename) }
  end

  describe '#import' do
    context 'no products imported' do
      it 'import completes' do
        expect(subject.import).to be_truthy
      end

      it 'imports nothing' do
        expect{ subject.import }.to change{ Variant.count }.by(0)
      end

      it 'has errors for every row' do
        expect{ subject.import }.to change{ subject.errors.size }.by(168)
      end
    end

    context 'products properly imported' do
      before do
        import_products.import
      end

      it 'succeeds' do
        subject.import
        puts subject.errors.full_messages
        expect(subject.import).to be_truthy
      end

      it 'imports the correct number of products' do
        expect{ subject.import }.to change{ Variant.count }.by(168)
      end
    end
  end
end
