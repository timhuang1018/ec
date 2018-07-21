class CartsController < ApplicationController
	def add

		current_cart.add_item(params[:id])
		session[:cart9999] = current_cart.serialize

		redirect_to products_path, notice: "#{Product.find(params[:id]).name} 已加入購物車"
	end
	def destroy
		puts "aaaaa"
		p current_cart
		p current_cart.items
		p current_cart.total
		current_user.money -= current_cart.total 
		current_user.save
		session[:cart9999] = nil

		redirect_to products_path, notice: "購物車已清空"
	end

	def save_and_destroy
		@cartrecord = CartRecord.new
		@cartrecord.user_id = current_user.id
		@cartrecord.user_name = current_user.name
		@cartrecord.total_price = current_cart.items.reduce(0) { |sum, item| sum + item.price }

		current_cart.items.each do |item|
			@cartdetail = @cartrecord.cart_details.build
			@cartdetail.product_name = item.product.name
			@cartdetail.quantity = item.quantity
			@cartdetail.unit_price = item.product.price
			@cartdetail.product_subtal = item.price
			@cartdetail.save
		end

		@cartrecord.save
		session[:cart9999] = nil
		redirect_to managers_path, notice: "購物車已清空"

	end




end
