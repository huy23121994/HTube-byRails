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

		params[:tags].each do |tag|
			TagsPost.create(post_id: @post.id, tag_id: tag)
		end
		redirect_to edit_post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_update_params)

		@post.save
		if @post.save
			flash[:notice] = "Post successfully updated"

			@category_relations = CategoriesPost.where(post_id: @post.id).all
			if !@category_relations.nil?
				@category_relations.each do |relation|
					relation.destroy
				end
			end

			if !params[:categories].nil?
				params[:categories].each do |category|
					CategoriesPost.create(post_id: @post.id, category_id: category)
				end
			end

			@tag_relations = TagsPost.where(post_id: @post.id).all
			if !@tag_relations.nil?
				@tag_relations.each do |relation|
					relation.destroy
				end
			end

			if !params[:tags].nil?
				params[:tags].each do |tag|
					TagsPost.create(post_id: @post.id, tag_id: tag)
				end
			end

			redirect_to edit_post_path
		else
			@categories = Category.all
			@tags = Tag.all
			render 'edit'
		end
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