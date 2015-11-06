class CommentsController < ApplicationController

	def new
		@entry = BlogEntry.find_by_id(params[:blog_entry_id])
		@blog_entry_comment = @entry.comments.new
	end

	def create
		@comment = Comment.new(params_helper)
		@entry = @comment.blog_entry_id
		if @entry.comment.create(@entry)
			flash[:success] = "Comment added successfully"
			redirect_to blog_entry_path(@entry)
		else
			flash[:warning] = "Something went wrong"
			render "new"
		end
	end

	def update
	end

	private

		def params_helper
			params.require(:comment).permit(:author, :content)
		end

end
