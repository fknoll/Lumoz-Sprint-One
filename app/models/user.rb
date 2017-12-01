class User < ApplicationRecord
  has_secure_password
  belongs_to :company # TODO: company is required
end
