class ProductsController < ApplicationController
before_action :set_product, :only => [ :show, :edit, :update, :destroy]
	def index
		@products = Product.all
	end
	def show
	end
	def edit
	end
	def update
		@product = Product.find(params[:id])
		@product.update(product_params)

		redirect_to product_url(@product)
	end
	def destroy
		@product.destroy

		redirect_to products_url
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.save

		redirect_to products_url
	end


	private
	def set_product
  		@product = Product.find(params[:id])
	end
	def product_params
	  params.require(:product).permit(:name, :description, :price, :category_id)
	end
end
