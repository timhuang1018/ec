module CartsHelper
	def current_cart
		@cart ||= Cart.from_hash(session[:cart9999])
	end
end
