class CheckInCheckOutReasonsController < ApplicationController
  expose :check_in_check_out_reasons, -> { CheckInCheckOutReg.all }

  def index
    render json: check_in_check_out_reasons
  end
end
