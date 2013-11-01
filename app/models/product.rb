class Product < ActiveRecord::Base
  attr_accessible :category, :group_id, :movieTile, :price, :product_id, :shipping_duration, :store, :sub_category

  def self.get_result_set search_text
  	query_string = get_query_string search_text
  	products_have_group = Product.where(" group_id is not null and (#{query_string})").group(:group_id).order(:product_id)
  	products_without_group = Product.where(" group_id is null and (#{query_string})").order(:product_id)
  	products_have_group + products_without_group
  end

  def self.get_query_string search_text
  	query_string = Product.column_names[2,7].join(" like '%#{search_text}%' or ")
  	query_string+" like '%#{search_text}%'"
  end
end
