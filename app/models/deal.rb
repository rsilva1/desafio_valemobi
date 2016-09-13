class Deal < ActiveRecord::Base
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  belongs_to :item
  has_many :offers

  def buyer_name
  	buyer.try(:username)
  end

  def seller_name
  	seller.try(:username)
  end
end
