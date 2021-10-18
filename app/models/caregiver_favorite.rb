class CaregiverFavorite < ApplicationRecord
    belongs_to :caregiver
    belongs_to :parent
end
