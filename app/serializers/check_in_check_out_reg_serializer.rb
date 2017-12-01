class CheckInCheckOutRegSerializer < ActiveModel::Serializer
  attributes :id, :reg_date, :employee, :check_in_time, :check_in_reason, :check_out_time, :check_out_reason, :remark
end
