class Admin < ApplicationRecord

    has_secure_password
    validates :usuario, presence: true, uniqueness: true
end
