class FrontEndController < ApplicationController
  before_action :generate_categories

  def index
  	@posts = Post.all
  end

  def category
  	category = Category.find_by(slug: params[:slug])
  	@posts = category.posts
  	render 'index'
  end

  def tag
    tag = Tag.find_by(slug: params[:slug])
    @posts = tag.posts
    render 'index'
  end

  def show_item
  	@post = Post.find_by(slug: params[:slug])
  end

  private
  	def generate_categories
  		@categories = Category.all
  	end
end
