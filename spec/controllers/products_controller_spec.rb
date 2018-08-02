require 'rails_helper'


RSpec.describe ProductsController, type: :controller do 
	before(:all) do
		@product_1 = Product.create(name: "cat", id: 1)
		@product_2 = Product.create(name: "dog", id: 2)
	end

	it "#index" do
		get :index 
		expect(response).to have_http_status(200)
		expect(response).to render_template(:index)
	end	

	it "#new" do
		get :new
		expect(response).to have_http_status(200)
		expect(response).to render_template(:new)
	end

	it "#edit" do
		get :edit, params: { id: @product_1.id } 
		expect(response).to have_http_status(200)
		expect(response).to render_template(:edit)
	end
end