class PublicController < ApplicationController
  def index
    build_potential_new_objects
    if user_signed_in?

      user = current_user
      @depot = user.depot

      @deals_buy = Deal.where(buyer: current_user)
      @deals_sell = Deal.where(seller: current_user).includes(:item)
    end
  end
end
