class CheckOutReason < OracleRecord
  self.table_name = 'act_gaa_aarsag'
  self.primary_key = 'gaa_aarsag_id'

  # gaa_aarsag_id | id
  # gaa_aarsag    | check_out_reason
  # bemaerkning   | remark
  alias_attribute :check_out_reason, :gaa_aarsag
  alias_attribute :remark, :bemaerkning
end
