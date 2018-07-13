class BuyRecordsController < ApplicationController
	def show
		@buyrecord = CartRecord.find(params[:id])	
		@cart_details = CartRecord.find(params[:id]).cart_details
	end

end
