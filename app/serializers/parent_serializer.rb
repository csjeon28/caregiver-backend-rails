class ParentSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :bio, :smoker, :city, :state, 
    :language, :hourly_rate, :has_pets, :number_of_children

end