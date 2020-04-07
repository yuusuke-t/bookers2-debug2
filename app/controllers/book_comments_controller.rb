class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_comment][:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		@book_comment.book_id = @book.id
		if @book_comment.save
			redirect_to @book
		else
			@user = @book.user
			@new_book = Book.new
			render 'books/show'
		end
	end

	def destroy
		@comment = BookComment.find(params[:comment_id])
		@book = @comment.book
		@comment.destroy
		redirect_to book_path(@book.id)
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
