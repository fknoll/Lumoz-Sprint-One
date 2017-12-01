class CustomConnectionHandler < ActiveRecord::ConnectionAdapters::ConnectionHandler

  def retrieve_connection_pool(spec_name)
    Rails.logger.info 'retrieve_connection_pool--'*3
    Rails.logger.info Current.user

    return nil unless Current.user

    company = Current.user[:company]
    spec_name = "company_#{company[:id]}"

      #ancestor_pool = pool_from_any_process_for(spec_name)

      #configuration = Rails.configuration.database_configuration['oracle-db'].dup
      #configuration.update(
        #database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
        #username: company[:username],
        #password: company[:password],
      #)
      ##establish_connection(configuration).tap do |pool|
        ##pool.schema_cache = ancestor_pool.schema_cache if ancestor_pool.schema_cache
      ##end

      #ActiveRecord::Base.establish_connection(configuration)

    config = {
      adapter:  'oracle_enhanced',
      database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
      username: company[:username],
      password: company[:password],
      schema:   'activity'
    }

    resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new(config)
    spec = resolver.spec(config)

    Rails.logger.info 'resolver'
    Rails.logger.info resolver.inspect
    Rails.logger.info spec.inspect

    establish_connection(spec_name, spec)
  end

  #def initialize
    #super
    ##@pools_by_company = {}
  #end

  #def retrieve_connection_pool(spec_name)
    #old_connection = super(spec_name)

    #Rails.logger.info 'retrieve_connection_pool--'*3
    #Rails.logger.info Base.configurations.inspect
    #Rails.logger.info spec_name

    ##resolver = ConnectionSpecification::Resolver.new(Base.configurations)
    ##spec = resolver.spec(config)

    #old_connection
  #end

  # Override the behaviour of ActiveRecord's ConnectionHandler to return a
  # connection pool for the current domain.
  #def retrieve_connection_pool(klass)
    #Rails.logger.info '::retrieve_connection_pool --- klass ---::'
    #Rails.logger.info klass
    #Rails.logger.info klass.klass.name

    #pool = @connection_pools[klass.name]
    #return pool if pool
    #return nil if ActiveRecord::Base == klass
    #retrieve_connection_pool klass.superclass

    ## Get current company somehow (Maybe store it in a class variable on
    ## each request or whatever)
    ##return nil unless Current.user
    ##company = Current.user[:company]
    ##Rails.logger.info '::company::'*4
    ##Rails.logger.info company
    ##@pools_by_company["company_#{company[:id]}"] ||= create_pool(company)
  #end

  #private

  #def create_pool(company)
    #config = {
      #adapter:  'oracle_enhanced',
      #database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
      #username: company[:username],
      #password: company[:password],
      #schema:   'activity'
    #}
    #Rails.logger.info '::create_pool::configuration--config--configuration'
    #Rails.logger.info config

    #OracleRecord.establish_connection(config)
  #end












  #def create_pool1(company)
    #config = {
      #adapter:  'oracle_enhanced',
      #database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
      #username: company[:username],
      #password: company[:password],
      #schema:   'activity'
    #}

    ##config = {
      ##database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
      ##username: company[:username],
      ##password: company[:password]
    ##}

    ##Rails.logger.info '::create_pool::config'
    ##Rails.logger.info config

    #configuration = Rails.configuration.database_configuration['oracle-db'].dup
    #configuration.update(
      #database: "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=#{company[:host]})(PORT=#{company[:port]})))(CONNECT_TIMEOUT=5)(TCP_CONNECT_TIMEOUT=5)(CONNECT_DATA=(SERVICE_NAME=#{company[:service_name]})))",
      #username: company[:username],
      #password: company[:password]
    #)
    #Rails.logger.info '::create_pool::configuration--config--configuration'
    #Rails.logger.info configuration


    #resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new(config)
    #spec = resolver.spec(config)





    ##resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new(config)
    ##resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new(ActiveRecord::Base.configurations)
    ##spec = resolver.spec(config)
    ##Rails.logger.info 'resolver'
    ##Rails.logger.info resolver.inspect
    ## Call ConnectionHandler#establish_connection, which receives a key
    ## (in this case the company) for the new connection pool
    ##ActiveRecord::ConnectionAdapters::ConnectionHandler.establish_connection("company_#{company[:id]}", resolver.spec)

    ##OracleRecord.establish_connection("company_#{company[:id]}", resolver.spec)
    ##OracleRecord.establish_connection(configuration)
    ##ActiveRecord::ConnectionAdapters::ConnectionHandler.establish_connection(spec)
    ##OracleRecord.establish_connection(spec)

    #establish_connection("company_#{company[:id]}", resolver.spec)
  #end
end
