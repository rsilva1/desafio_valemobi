class PublicController < ApplicationController
  def index
    if user_signed_in?
      build_potential_new_objects

      user = current_user
      @depot = user.depot
    end
  end
end
