require 'rails_helper'
require 'factory_bot_rails'


RSpec.describe BooksController, type: :controller do
    let(:library) { create(:library) }
    let(:book) { create(:book, library: library) }
  
    describe 'GET #index' do
      it 'returns a successful response' do
        get :index, params: { library_id: library.id }
        expect(response).to have_http_status(:ok)
      end
    end
  
    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new book' do
          post :create, params: { library_id: library.id, book: attributes_for(:book) }
          expect(response).to have_http_status(:created)
        end
      end
  
      context 'with invalid parameters' do
        it 'returns unprocessable entity status' do
          post :create, params: { library_id: library.id, book: { title: '' } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  
    describe 'GET #search' do
      it 'returns a successful response' do
        get :search, params: { library_id: library.id, global_search_flag: true, search_text: 'Book' }
        expect(response).to have_http_status(:ok)
      end
    end

  end
  