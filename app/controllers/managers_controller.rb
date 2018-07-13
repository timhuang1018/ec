class ManagersController < ApplicationController
	def home
	end
	def index
	end
	def create
	end

	def buy_record
		@buyrecords = CartRecord.all
	end
	
	def check_out
	end
	def show_date
		@b = Time.now
	end
	def update 
	end
	def check_stock
		@products = Product.where("in_stocks < safety_stocks")

	end
	def update_stock	
		@products = Product.where("in_stocks < safety_stocks")
		#in_stock 個別增加管理者輸入之值,save個別儲存
		@products.each do |product|
			params[:add_number].each do |key,value|
				if key = product.id
				product.in_stocks = product.in_stocks + value.to_i
				end
			end
			product.save
		end
		redirect_to managers_path
	end


end
