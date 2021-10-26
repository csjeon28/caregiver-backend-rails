class Parent < ApplicationRecord
    has_secure_password
    has_many :jobs, through: :schedules
    has_many :caregivers, through: :jobs
    has_many :candidates

    validates :email, uniqueness: true
end