class ItemsController < ApplicationController
  before_action :authenticated_user_or_admin
  before_action :authenticate_admin!, only: [:index]

  respond_to :json

  def index
  end

  def create
  	item_params = allowed_params
  	product_params = item_params["product"]
  	product = Product.find_or_create_by(product_params)

  	item_params["product"] = product
  	item = Item.create(item_params)

  	if item.valid?
  	  DepotsItem.create(depot: current_user.depot, item: item)
      render json: item
    else
    	render json: { "error": "Não foi possível adicionar o item" }
    end
  end

  def destroy
  	item = Item.find(params[:id])
  	current_user.depot.items.delete(item)
  	item.destroy
  	redirect_to :back
  end

  private
  	def allowed_params
      params.require(:item).permit(:quantity, :price, product: [:name, :category_id])
  	end
end
