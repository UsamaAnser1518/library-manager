class LibrariesController < ApplicationController
  def index
    @libraries = Library.all

    render json: @libraries, status: :ok
  end

  def create
    @library = Library.new(library_params)

    if @library.save
      render json: @library, status: :created
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  private

  def library_params
    params.require(:library).permit(:name)
  end
end
