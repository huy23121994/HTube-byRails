class PostsController < ApplicationController
	
	include PostsHelper

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@categories = Category.all
		@tags = Tag.all
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
		@tags = Tag.all
	end

	def create
		@post = Post.new(post_params)
		@post.embed_link = get_embed_link(params['link_video'])
		@post.img_preview = get_img_video_link(params['link_video'])
		@post.save
		
		params[:categories].each do |category|
			CategoriesPost.create(post_id: @post.id, category_id: category)
		end
		redirect_to posts_path
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_update_params)
		@post.save
		
		redirect_to :back
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title,:description)
		end

		def post_update_params
			params.require(:post).permit(:title,:description,:embed_link,:img_preview)
		end

end
