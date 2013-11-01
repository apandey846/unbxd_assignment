class ProductsController < ApplicationController
  def index
  	@product = Product.find(10)
  end

  def search_result
  	@products  = Product.get_result_set(params[:product_id])
  end

  def show
  	@product = Product.find(params[:id])
  	product_version = @product.product_id.split('-').first
  	@similar_products = Product.where("product_id like '%#{product_version}-%'").order(:product_id)
  end
end
