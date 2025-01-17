class BooksController < ApplicationController
  before_action :set_library, only: [:index, :create]
  before_action :set_book, only: [:create]

  def index
    render json: @library.books, status: :ok
  end

  def create
    if @book.present?
      @book.increment!(:copies)
    else
      @book = @library.books.new(book_params)
    end

    if @book.save
      render json: @book, status: :created
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def search
    books = Book.perform_search(search_params)
    
    render json: books, status: :ok
  end

  private

  def search_params
    params.permit(:global_search_flag, :search_text, :library_id)
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :author)
  end

  def set_library
    @library = Library.find(params[:library_id])
  end

  def set_book
    @book = @library.books.find_by(title: book_params[:title], isbn: book_params[:isbn])
  end
end
