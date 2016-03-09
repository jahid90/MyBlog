class PagesController < ApplicationController

  def home
  end

  def posts
    @posts = Post.all
  end

end
