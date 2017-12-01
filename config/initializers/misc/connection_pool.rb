module CustomConnectionPoolToOracle
  def connection
    result = super
    set_default_role(result) if is_oracle_adapter(result)
    result
  end

  private

  def set_default_role(result)
    sql = "select 'ACT_' || USOFT_USERGROUP_NAME \"ROLE\" from GENW_USER where ACTIVE = 'Y' and USERNAME = USER"
    role = result.execute(sql).fetch.first
    result.execute("set role #{role}")
  rescue ActiveRecord::StatementInvalid => e
    puts e
  end

  def is_oracle_adapter(result)
    result.adapter_name == 'OracleEnhanced'
  end
end

ActiveRecord::ConnectionAdapters::ConnectionPool.prepend CustomConnectionPoolToOracle
