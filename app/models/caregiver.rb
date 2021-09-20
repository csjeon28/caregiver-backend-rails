class Caregiver < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :parents, through: :jobs

    validates :email, uniqueness: true
end
