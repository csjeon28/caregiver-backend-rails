class Job < ApplicationRecord
    belongs_to :parent
    belongs_to :caregiver
    belongs_to :schedule
    has_many :candidates

    def self.caregiver_jobs(id)
        Schedule.left_outer_joins(:jobs).where(jobs: { caregiver_id: id })
    end
    
    def self.parent_jobs(id)
        Schedule.left_outer_joins(:jobs).where(jobs: { parent_id: id })
    end

    def self.available_jobs
        Job.all.select{ |job| !job.caregiver_id }
    end
end
