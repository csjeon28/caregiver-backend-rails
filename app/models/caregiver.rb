class Caregiver < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :parents, through: :jobs
    has_many :candidates

    validates :email, uniqueness: true
end
