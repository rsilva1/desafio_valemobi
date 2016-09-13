class Users::RegistrationsController < Devise::RegistrationsController
  clear_respond_to
  respond_to :json

  def create
  	super do |resource|
  		Depot.create(user: resource)
  	end
  end
end
