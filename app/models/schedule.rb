class Schedule < ApplicationRecord
    belongs_to :parent
    has_many :jobs
end
