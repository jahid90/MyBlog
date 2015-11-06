class BlogEntriesController < ApplicationController

	def index
		@entries = BlogEntry.all
	end

	def new
		@entry = BlogEntry.new
	end

	def create
		entry = BlogEntry.new(params_helper)
		if entry.save
			flash[:success] = "New entry successfully created"
			redirect_to blog_entries_path
		else
			flash.now[:warning] = "Failed to create entry"
			render "new"
		end
	end

	def show
		@entry = BlogEntry.find_by_id(params[:id])
	end

	def edit
		@entry = BlogEntry.find_by_id(params[:id])
	end

	def update
		@entry = BlogEntry.find_by_id(params[:id])
		if @entry.update_attributes(params_helper)
			flash[:success] = "Updated successfully"
			redirect_to blog_entries_path
		else
			flash.now[:warning] = "Failed to update"
			render "edit"
		end
	end

	def destroy
		entry = BlogEntry.find_by_id(params[:id])
		if entry.delete
			flash[:success] = "Successfully deleted"
			redirect_to blog_entries_path
		else
			flash[:warning] = "Could not delete entry"
			redirect_to blog_entries_path
		end
	end

	private
		def params_helper
			params.require(:blog_entry).permit(:title, :body)
		end

end
