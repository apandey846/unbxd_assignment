class Product < ActiveRecord::Base
  attr_accessible :category, :group_id, :movieTile, :price, :product_id, :shipping_duration, :store, :sub_category

  def self.get_result_set product_id
  	products_have_group = Product.where("product_id like '%#{product_id}%' and group_id is not null").group(:group_id).order(:product_id)
  	products_without_group = Product.where("product_id like '%#{product_id}%' and group_id is null").order(:product_id)
  	products_have_group + products_without_group
  end
end
