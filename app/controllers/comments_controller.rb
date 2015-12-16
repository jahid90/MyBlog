class CommentsController < ApplicationController

	before_action :find_post, only: [:create, :destroy]

	def create
		@comment = @post.comments.build(params_helper)

		flash[:warning] = "Failed to save comment" unless @comment.save

		redirect_to post_path(@post)
	end

	def destroy
		comment = Comment.find_by_id(params[:id])

		flash[:warning] = "Could not delete comment" unless comment.destroy
		
		redirect_to post_path(@post)
	end

	private

		def params_helper
			params.require(:comment).permit(:author, :content)
		end

		def find_post
			@post = Post.find_by_id(params[:post_id])
		end

end
