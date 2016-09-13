class Item < ActiveRecord::Base
  belongs_to :product
  accepts_nested_attributes_for :product

  def total_price
  	self.price*self.quantity
  end
end
