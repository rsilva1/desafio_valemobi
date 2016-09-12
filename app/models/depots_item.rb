class DepotsItem < ActiveRecord::Base
  belongs_to :depot
  belongs_to :item
end
