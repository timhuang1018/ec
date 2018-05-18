class CategoriesController < ApplicationController
	before_action :set_category, :only => [:show, :edit, :update, :destroy]
	def index
		@categories = Category.all
	end
	def show
	end
	def edit		
	end
	def update
		@category = Category.find(params[:id])
		@category.update(category_params)

		redirect_to category_path(@category)
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(category_params)

		@category.save
		redirect_to categories_path
	end
	def destroy
		@category.destroy

		redirect_to categories_path
	end

	private
	def set_category
		@category = Category.find(params[:id])
	end
	def category_params
		params.require(:category).permit(:name)
	end
end
