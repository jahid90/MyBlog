class CommentsController < ApplicationController

	before_filter do
		@entry = BlogEntry.find_by_id(params[:blog_entry_id])
	end

	def create
		@comment = @entry.comments.new(params_helper)

		flash[:warning] = "Failed to save comment" unless @comment.save

		redirect_to blog_entry_path(@entry)
	end

	def destroy
		@entry = BlogEntry.find_by_id(params[:blog_entry_id])
		comment = Comment.find_by_id(params[:id])

		flash[:warning] = "Could not delete" unless comment.destroy
		
		redirect_to blog_entry_path(@entry)
	end

	private

		def params_helper
			params.require(:comment).permit(:author, :content)
		end

end
