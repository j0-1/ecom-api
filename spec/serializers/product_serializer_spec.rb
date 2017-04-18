require 'rails_helper'

describe ProductSerializer, type: :serializer do
  let(:object) { build(:product) }
  let(:serialized) { described_class.new(object).as_json }

  context 'json body' do
    it 'has expected keys' do
      expect(serialized.keys).to include(:name, :description, :images, :variants)
    end
  end
end
