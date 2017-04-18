require 'rails_helper'

describe 'inventory' do
  describe 'GET inventory' do
    before do
      get '/api/v1/inventory/'
    end

    it 'returns 200 OK' do
      expect(response).to be_success
    end
  end
end
