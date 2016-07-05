class TagsController < ApplicationController

	def index
		@tags = Tag.all
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
			flash[:notice] = "Post successfully updated"
			redirect_to :back
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

	private
		def tag_params
			params.require(:tag).permit(:tag_name,:slug)
		end

end
