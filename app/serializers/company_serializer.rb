class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password, :host, :port, :service_name
end
