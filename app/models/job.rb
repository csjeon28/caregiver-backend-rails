class Job < ApplicationRecord
    belongs_to :parent
    belongs_to :caregiver
    belongs_to :schedule
end
