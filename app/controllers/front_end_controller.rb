class FrontEndController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show_item
  	@post = Post.find(params[:id])
  end
end
