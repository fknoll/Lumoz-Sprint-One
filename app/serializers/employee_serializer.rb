class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :initials, :full_name, :remark
end

# ALL ATTRIBUTES:
# def attributes(*args)
# object.attributes.symbolize_keys
# end
