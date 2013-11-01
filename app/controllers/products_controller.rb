class ProductsController < ApplicationController
  def index
  	@product = Product.find(10)
  end

  def search_result
  	if params[:search_text].present?
  	  @products  = Product.get_result_set(params[:search_text]).sort!
    else
  	  @products = []
    end
  end

  def show
  	@product = Product.find(params[:id])
  	product_version = @product.product_id.split('-').first
  	@similar_products = Product.where("product_id like '%#{product_version}-%'").order(:product_id)
  end
end
