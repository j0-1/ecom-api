require 'rails_helper'

describe VariantSerializer, type: :serializer do
  let(:object) { build(:variant) }
  let(:serialized) { described_class.new(object).as_json }

  context 'json body' do
    it 'has expected keys' do
      expect(serialized.keys).to include(:waist, :length, :style, :inventory_count)
    end
  end
end
