require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
    describe 'GET #index' do
      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  
    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new library' do
          post :create, params: { library: attributes_for(:library) }
          expect(response).to have_http_status(:created)
        end
      end
  
      context 'with invalid parameters' do
        it 'returns unprocessable entity status' do
          post :create, params: { library: { name: '' } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
