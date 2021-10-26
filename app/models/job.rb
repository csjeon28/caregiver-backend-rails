class Job < ApplicationRecord
    belongs_to :parent
    belongs_to :caregiver
    has_many :candidates

    def self.available_jobs
        Job.all.select{ |job| !job.caregiver_id }
    end
end
