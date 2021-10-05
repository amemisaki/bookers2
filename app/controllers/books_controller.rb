class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def books
    @user = User.find(current_user.id)
    @users = User.joins(:books).select("users.profile_image_id, books.*")
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def create
      @book = Book.new(book_params)
      @users = User.joins(:books).select("users.profile_image_id, books.*")
      if @book.save
        last_id = Book.last(1)
        flash[:notice] = 'Create successfully'
      redirect_to controller: :books, action: :show, id: last_id
      else
        @books = Book.all
        render template: 'books/books'
      end
  end
  
  def update
    @book = Book.find(params[:id])
    if
      @book.update(book_params)
      flash[:notice] = 'Update successfully'
      redirect_to controller: :books, action: :show, id: params[:id]
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Delete successfully'
  end
  
  private
  def book_params
    params.require(:book).permit(:user_id,:title, :body, )
  end
end
