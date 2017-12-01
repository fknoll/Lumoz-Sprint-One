class CheckInReason < OracleRecord
  self.table_name = 'act_komme_aarsag'
  self.primary_key = 'komme_aarsag_id'

  # komme_aarsag_id | id
  # komme_aarsag    | check_in_reason
  # bemaerkning     | remark
  alias_attribute :check_in_reason, :komme_aarsag
  alias_attribute :remark, :bemaerkning
end
