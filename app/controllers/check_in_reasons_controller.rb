class CheckInReasonsController < ApplicationController
  expose :check_in_reasons, -> { CheckInReason.all }

  def index
    render json: check_in_reasons
  end
end
