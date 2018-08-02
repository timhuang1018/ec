require 'rails_helper'

RSpec.describe Cart, type: :model do
	before(:all) do
		@product1 = Product.create(name: "cat", id: "5", price: 200)
		@product2 = Product.create(name: "dog", id: "6", price: 100)
	end

	describe "購物車基本功能" do
		it "把商品丟到購物車裡，購物車內會有商品" do
			cart = Cart.new
			cart.add_item @product1.id
			expect(cart.empty?).to be false
		end

		it "如果加了相同種類的商品，商品數量增加" do
			cart = Cart.new
			3.times { cart.add_item(1) }
			5.times { cart.add_item(2) }
			2.times { cart.add_item(3) }

			expect(cart.items.length).to be 3
			expect(cart.items.first.quantity).to be 3
			expect(cart.items.second.quantity).to be 5
		end

		it "丟到購物車的商品可查看" do
			cart = Cart.new
			4.times { cart.add_item(@product1.id)}
			2.times { cart.add_item(@product2.id)}

			expect(cart.items.first.product_id).to be @product1.id
			expect(cart.items.second.product_id).to be @product2.id
	#		expect(cart.items.first.product).to be_a Product
		end

		it "可以計算在購物車內的商品總消費金額" do
			cart = Cart.new

			3.times {
				cart.add_item(@product1.id)
				cart.add_item(@product2.id)
			}

	#		expect(cart.total_price).to be 900
		end
	end

	
	describe "購物車進階功能" do
		it "可以將購物車內容轉換成Hash存進Session" do
			cart = Cart.new
			3.times { cart.add_item(2)}
			4.times { cart.add_item(5)}

			expect(cart.serialize).to eq session_hash
		end
		it "可以把 Session的內容(Hash格式)，還原成購物車的內容" do
			cart = Cart.from_hash(session_hash)

			expect(cart.items.first.product_id).to be 2
			expect(cart.items.first.quantity).to be 3
			expect(cart.items.second.product_id).to be 5
			expect(cart.items.second.quantity).to be 4
		end
	end


	private
	def session_hash
		{
			"items" => [
				{"product_id" => 2, "quantity" => 3},
				{"product_id" => 5, "quantity" => 4}]
		}
	end
end