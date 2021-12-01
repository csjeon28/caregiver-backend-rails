class Job < ApplicationRecord
    belongs_to :parent
    belongs_to :caregiver, optional: true
    has_many :candidates

    # def self.available_jobs
    #     Job.all.select{ |job| !job.caregiver_id }
    # end

    # accepts_nested_attributes_for :candidates

    validates :title, :job_description, :specific_days_needed, :hourly_rate, :number_of_children, presence: true
end
