class JobSerializer < ActiveModel::Serializer
    attributes :id, :title, :city, :state, :hourly_rate, :job_description, :number_of_children, :specific_days_needed, :required_to_drive

end