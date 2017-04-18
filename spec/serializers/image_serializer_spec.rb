require 'rails_helper'

describe ImageSerializer, type: :serializer do
  let(:object) { build(:image) }
  let(:serialized) { described_class.new(object).as_json }

  context 'json body' do
    it 'has expected keys' do
      expect(serialized.keys).to include(:url)
    end
  end
end
