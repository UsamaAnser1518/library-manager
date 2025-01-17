require 'rails_helper'

RSpec.describe BorrowersController, type: :controller do
    let(:library) { create(:library) }
    let(:borrower) { create(:borrower, libraries: [library]) }
    let(:book) { create(:book, library: library) }
  
    describe 'GET #index' do
      it 'returns a successful response' do
        get :index, params: { library_id: library.id }
        expect(response).to have_http_status(:ok)
      end
    end
  
    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new borrower' do
          post :create, params: { library_id: library.id, borrower: attributes_for(:borrower) }
          expect(response).to have_http_status(:created)
        end
      end
  
      context 'with invalid parameters' do
        it 'returns unprocessable entity status' do
          post :create, params: { library_id: library.id, borrower: { name: '', card_title: '', card_number: '', card_csv: '' } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  
    describe 'POST #lend_book' do
      context 'when book is available' do
        it 'lends a book to the borrower' do
          post :lend_book, params: { library_id: library.id, id: borrower.id, book_id: book.id }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
