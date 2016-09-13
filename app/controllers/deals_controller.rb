class DealsController < ApplicationController
  before_action :authenticated_user_or_admin

  def index
  end

  def create
  	deal = Deal.create(allowed_params)
  	if deal.valid?
  	  return render json: deal
  	else
  	  return render json: { "error": "Não foi possível criar negociação" }
  	end
  end

  def destroy
  end

  private
  	def allowed_params
      params.require(:deal).permit(:buyer_id, :seller_id, :item_id, :deal_type)
  	end
end
