class BorrowersController < ApplicationController
  before_action :set_library
  before_action :set_book, only: :lend_book

  def index
    render json: @library.borrowers, status: :ok
  end

  def create
    return if find_borrower

    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      @library.borrowers << @borrower

      render json: @borrower, status: :created 
    else
      render json: { errors: @borrower.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def lend_book
    return unless set_borrower && @book && @book.is_available?
    
    return if @borrower.books_with_due_date.present?
  
    lend_book_to_borrower

    if @borrower.save
      render json: @borrower.books, status: :ok
    else
      render json: { errors: @borrower.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def return_book
    return unless set_borrower
    
    @borrower.borrower_books.find_by(book_id: book_to_return&.id)&.destroy

    book = @library.books.find_by(find_book_params)
    
    if book.present?
      book.increment!(:copies)
    else
      @library.books << Book.create(book_params)
    end

    render json: @borrower.books, status: :ok
  end

  private

  def book_to_return
    Book.find_by(find_book_params)
  end

  def book_params
    params.permit(:title, :isbn, :author)
  end

  def lend_book_to_borrower
    @borrower.borrower_books.create(book: @book, due_date: 7.days.from_now)
    @book.decrement!(:copies)
  end

  def borrower_params
    params.require(:borrower).permit(:name, :card_csv, :card_title, :card_number)
  end

  def set_library
    @library = Library.find(params[:library_id])
  end

  def find_borrower
    @library.borrowers.find_by(name: borrower_params[:name], card_number: borrower_params[:card_number]).present?
  end

  def set_borrower
    @borrower = @library.borrowers.find(params[:id])
  end

  def find_book_params
    params.permit(:isbn, :title)
  end

  def set_book
    @book = @library.books.find_by(find_book_params)
  end
end
