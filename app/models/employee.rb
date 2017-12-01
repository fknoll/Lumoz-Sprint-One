class Employee < OracleRecord
  self.table_name = 'act_medarbejder'
  self.primary_key = 'medarbejder_id'

  self.ignored_columns = %w(alternativ_unik_identifikation aktiv)

  # medarbejder_id | id
  # initialer      | initials
  # fuldt_navn     | full_name
  # bemaerkning    | remark
  alias_attribute :initials, :initialer
  alias_attribute :full_name, :fuldt_navn
  alias_attribute :remark, :bemaerkning
end
