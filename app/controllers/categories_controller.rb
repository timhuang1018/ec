class CategoriesController < ApplicationController
	before_action :set_category, :only => [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
		@category = Category.new

	end
	def show
		@need_products = @category.products
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

		respond_to do |format|
			if @category.save
				format.html { redirect_to @category, notice: '成功產生新類別'}
				format.js
				format.json { render json: @category, status: :create, location: @category}
			end
		end
	end
	
	def destroy
		@category.destroy

		redirect_to categories_path
	end
	def product_update
		@product = Product.find(params["product"][:id])
		@product.update(product_params)

		redirect_to categories_path
	end

	private
	def set_category
		@category = Category.find(params[:id])
		@category_products = Product.all
	end
	def category_params
		params.require(:category).permit(:name)
	end
	def product_params
	  params.require(:product).permit(:name, :description, :price, :category_id, :id)
	end

	protected

end
