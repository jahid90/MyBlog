class PostsController < ApplicationController

	before_action :find_post, only: [:edit, :update, :destroy]
	before_action :find_global_post, only: [:show]
	before_action :authenticate_user!, except: [:show]

	def index
		@posts = current_user.posts.all
	end

	def show
		@is_owner = current_user.id == @post.user_id
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(params_helper)
		if @post.save
			flash[:success] = "Post created successfully"
			redirect_to post_path(@post)
		else
			flash.now[:danger] = "Failed to create post"
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
			flash.now[:danger] = "Failed to update"
			render "edit"
		end
	end

	def destroy
		if @post.delete
			flash[:success] = "Successfully deleted"
			redirect_to posts_path
		else
			flash[:danger] = "Could not delete post"
		end
	end

	private
		def params_helper
			params.require(:post).permit(:title, :body)
		end

		def find_global_post
			@post = Post.find_by_id(params[:id])
		end

		def find_post
			@post = current_user.posts.find_by_id(params[:id])
		end

end
