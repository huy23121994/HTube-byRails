class TagsController < ApplicationController
	before_action :signed_in_user
	
	def index
		@tags = Tag.get_all_tags
		@tag = Tag.new
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
	    @tag.tag_name = params['tag_name']
		if params['slug'].empty?
			@tag.slug = params['tag_name'].slugify_trim
		else
			@tag.slug = params['slug'].slugify_trim
		end
		
		@tag.save
		if @tag.save
			flash[:notice] = "Tag successfully updated"
			redirect_to edit_tag_path
		else
			render 'edit'
		end
	end

	def create
		@tag = Tag.new
		@tag.tag_name = params['tag_name']
		if params['slug'].empty?
			@tag.slug = params['tag_name'].slugify_trim
		else
			@tag.slug = params['slug'].slugify_trim
		end
		
		@tag.save
		if @tag.save
			flash[:notice] = "Tag successfully created"
			redirect_to tags_path
		else
			@tags = Tag.all
			render 'index'
		end
	end

	def destroy
	  	@tag = Tag.find(params[:id])
	  	@tag.destroy
	 
	  	redirect_to tags_path
	end

end
