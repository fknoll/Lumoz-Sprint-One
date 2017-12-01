class OracleRecord < ActiveRecord::Base
  self.abstract_class = true
  #self.connection_handler = CustomConnectionHandler.new

  #Rails.logger.info Current.user
  #establish_connection(:'igorbilan-company')

  #establish_connection(
    #adapter:  'oracle_enhanced',
    #database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
    #username: company[:username],
    #password: company[:password],
    #schema:   'activity'
  #)

  # https://stackoverflow.com/questions/16775795/rails-switch-connection-on-each-request-but-keep-a-connection-pool
  # https://stackoverflow.com/questions/44055748/rails-switch-db-connection-on-request
  # http://mavens.github.io/rails/2016/02/09/rails-multi-db.html
  #
  #
  # https://github.com/thiagopradi/octopus
  # https://github.com/hsgubert/rails-sharding/wiki/How-rails-sharding-connection-handling-works
end
