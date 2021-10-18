class Parent < ApplicationRecord
    has_secure_password
    has_many :schedules
    has_many :jobs, through: :schedules
    has_many :caregivers, through: :jobs
    has_many :candidates
    has_many :caregiver_favorites, through: :caregivers
    has_many :parent_favorites

    validates :email, uniqueness: true
end
