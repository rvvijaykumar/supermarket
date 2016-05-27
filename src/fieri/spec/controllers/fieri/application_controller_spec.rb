require 'rails_helper'

module Fieri
  RSpec.describe ApplicationController, type: :controller do
    controller do
      def hi
        render text: 'hello'
      end
    end

    before do
      routes.draw { get 'hi' => 'fieri/application#hi' }
    end

    it 'says hello' do
      get :hi
      expect(response.body).to match(/hello/)
    end

    context 'when fieri is not enabled' do
      before do
        expect(controller).to receive(:enabled_features).and_return(['nope'])
      end

      it 'returns a 404' do
        get :hi
        expect(response).to have_http_status(404)
      end

      it 'include error message stating that the feature is not enabled' do
        get :hi
        expect(response.body).to match('fieri is not enabled')
      end
    end
  end
end
