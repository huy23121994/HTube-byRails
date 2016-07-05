class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
 
	    @category.category = params['category']
		if params['slug'].empty?
			@category.slug = params['category'].slugify_trim
		else
			@category.slug = params['slug'].slugify_trim
		end
		
		@category.save
		if @category.save
			flash[:notice] = "Category successfully updated"
			redirect_to edit_category_path
		else
			render 'edit'
		end
	end

	def create
		@category = Category.new
		@category.category = params['category']
		if params['slug'].empty?
			@category.slug = params['category'].slugify_trim
		else
			@category.slug = params['slug'].slugify_trim
		end
		
		@category.save
		if @category.save
			flash[:notice] = "Category successfully created"
			redirect_to categories_path
		else
			@categories = Category.all
			render 'index'
		end
	end

	def destroy
	  	@category = Category.find(params[:id])
	  	@category.destroy
	 
	  	redirect_to categories_path
	end

end
