class CaregiverSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :date_of_birth, :bio, :smoker, :city, :state, 
    :language, :hourly_rate, :ability_to_drive, :first_aid_cert, :CPR_cert

end