class CheckOutReasonsController < ApplicationController
  expose :check_out_reasons, -> { CheckOutReason.all }

  def index
    render json: check_out_reasons
  end
end
