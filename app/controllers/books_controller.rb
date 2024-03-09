class BooksController < ApplicationController
  respond_to :json

  def create
    @book = Book.new(book_parameters)

    if @book.save
      render json: @book, status: :ok
    else
      render json: {
        status: 400,
        message: "Book could't be created. #{@book.errors.full_messages.to_sentence}"
      }
    end
  end

  # /books?{user_id}
  def index
    user_id = params[:user_id]
    render json: Book.where(user_id: user_id).order('title ASC')
  end

  def update
    @book = Book.find(params[:id])

    @book.attributes = book_parameters

    if @book.save
      render json: {
        status: 200,
        message: "Book updated successfully"
      }, status: :ok
    else
      render json: {
        status: 400,
        message: "Something went wrong while updating the book. #{@book.errors.full_messages.to_sentence}"
      }, status: :bad_request
    end
  end

  def destroy
    begin
      @book = Book.find(params[:id])
      @book.destroy

      render json: {
        status: 200,
        message: "Book deleted successfully"
      }, status: :ok

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 404,
        message: "Book not found"
      }, status: :not_found
    rescue => e
      render json: {
        status: 500,
        message: "Something went wrong when trying to delete the book."
      }, status: :internal_server_error    
    end
  end

  def book_parameters
    params.require(:book).permit(%i[title author total_chapters current_chapter user_id category_id])
  end
end
