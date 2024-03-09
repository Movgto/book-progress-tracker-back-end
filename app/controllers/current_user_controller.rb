class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index    
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
  end
end