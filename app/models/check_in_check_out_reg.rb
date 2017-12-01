class CheckInCheckOutReg < OracleRecord
  self.table_name = 'act_komme_gaa_reg'
  self.primary_key = 'komme_gaa_reg_id'
  self.ignored_columns = %w(komme_tidspunkt_time komme_tidspunkt_minut gaa_tidspunkt_time gaa_tidspunkt_minut)

  # komme_gaa_reg_id      | id
  # dato                  | reg_date
  # act20_medarbejder_id  | employee
  # komme_tidspunkt       | check_in_time
  # act69_komme_aarsag_id | check_in_reason
  # gaa_tidspunkt         | check_in_time
  # act70_gaa_aarsag_id   | check_out_reason
  # bemaerkning           | remark
  alias_attribute :reg_date, :dato
  alias_attribute :employee, :act20_medarbejder_id
  alias_attribute :check_in_time, :komme_tidspunkt
  alias_attribute :check_in_reason, :act69_komme_aarsag_id
  alias_attribute :check_out_time, :gaa_tidspunkt
  alias_attribute :check_out_reason, :act70_gaa_aarsag_id
  alias_attribute :remark, :bemaerkning
end
