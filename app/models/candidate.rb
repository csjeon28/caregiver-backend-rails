class Candidate < ApplicationRecord
    belongs_to :job
    belongs_to :caregiver, optional: true

    validates_uniqueness_of :caregiver_id, scope: [:job_id]
end
