require 'rails_helper'

RSpec.describe CartItem, type: :model do
	before(:all) do
		@product1 = Product.create(name: "cat", id: "5", price: 500)
		@product2 = Product.create(name: "dog", id: "6", price: 100)
	end

		it "每個Cart Item都可以計算自己的金額(小計)" do 

			cart = Cart.new

			4.times { cart.add_item(@product1.id)}
			2.times { cart.add_item(@product2.id)}

			expect(cart.items.first.product_id).to be 5
			expect(cart.items.first.quantity).to be 4
	#		expect(cart.items.first.price).to be 2000
	#		expect(cart.items.second.price).to be 200
		end

end
