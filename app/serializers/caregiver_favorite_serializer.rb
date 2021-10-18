class CaregiverFavoriteSerializer < ActiveModel::Serializer
  attributes :id, :caregiver_id, :parent_id
end
