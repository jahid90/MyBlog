class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params_helper)
		if @post.save
			flash[:success] = "Post created successfully"
			redirect_to post_path(@post)
		else
			flash.now[:warning] = "Failed to create post"
			render "new"
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(params_helper)
			flash[:success] = "Updated successfully"
			redirect_to post_path(@post)
		else
			flash.now[:warning] = "Failed to update"
			render "edit"
		end
	end

	def destroy
		if @post.delete
			flash[:success] = "Successfully deleted"
			redirect_to posts_path
		else
			flash[:warning] = "Could not delete post"
		end
	end

	private
		def params_helper
			params.require(:post).permit(:title, :body)
		end

		def find_post
			@post = Post.find_by_id(params[:id])
		end

end
