class ParentSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :bio, :smoker, :city, :state, :country, 
    :language, :hourly_rate, :has_pets, :profile_image, :number_of_children

end