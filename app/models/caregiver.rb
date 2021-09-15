class Caregiver < ApplicationRecord
    has_many :jobs
    has_many :parents
end
