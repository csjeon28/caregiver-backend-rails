class ParentFavoriteSerializer < ActiveModel::Serializer
  attributes :id, :parent_id, :caregiver_id
end
