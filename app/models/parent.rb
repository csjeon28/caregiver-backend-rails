class Parent < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :caregivers, through: :jobs

    validates :email, uniqueness: true
end
