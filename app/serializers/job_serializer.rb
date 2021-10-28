class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :hourly_rate, :job_description, :number_of_children, :specific_days_needed, :required_to_drive, :parent_id

end