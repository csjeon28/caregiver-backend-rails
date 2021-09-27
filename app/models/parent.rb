class Parent < ApplicationRecord
    has_secure_password
    has_many :schedules
    has_many :jobs, through: :schedules
    has_many :caregivers, through: :jobs

    validates :email, uniqueness: true
end
