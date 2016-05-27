require 'rails_helper'

module Fieri
  RSpec.describe JobsController, type: :controller do
    routes { Fieri::Engine.routes }

    describe 'POST /jobs' do
      context 'when fieri is not enabled' do
        before do
          expect(controller).to receive(:enabled_features).and_return(['nope'])
        end
        it 'returns a 404' do
          post :create
          expect(response).to have_http_status(404)
        end
      end
    end
  end
end
