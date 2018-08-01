module CartsHelper
	def current_cart
		@cart ||= Cart.from_hash(session[:cart9999])
	end

	def has_cart?
		!current_cart.items.empty?
	end

	def total
		current_cart.items.reduce(0) { |sum, item| sum + item.price }
	end


  def enough_money?(total_price)
  	current_user.money > total_price
  end
end
