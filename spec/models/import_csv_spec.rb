require 'rails_helper'

RSpec.describe ImportCsv, type: :model do
  let(:filename) { mock_file('products.csv') }
  subject { described_class.new(filename) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:filename) }
  end

  describe '#import' do
    it 'fails' do
      expect(subject.import).to be_falsey
    end

    it 'imports nothing' do
      expect{ subject.import }.to change{ Product.count }.by(0)
    end

    it 'has one error' do
      expect{ subject.import }.to change{ subject.errors.size }.by(1)
    end

    it 'has an unimplemented error for this base class' do
      subject.import
      expect(subject.errors.full_messages).to eq(["unimplemented add_row_to_database"])
    end
  end
end
