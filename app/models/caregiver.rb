class Caregiver < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :parents, through: :jobs
    has_many :candidates

    PASSWORD_REQ = /\A
    (?=.{8,}) # Minimum 8 characters
    (?=.*\d) # Contains at least one number
    (?=.*[a-z]) # Contains at least one lowercase letter
    (?=.*[A-Z]) # Contains at least one uppercase letter
    (?=.*[[:^alnum:]]) # Contains at least one symbol
    /x
    
    validates :password, :email, :first_name, :last_name, :date_of_birth, :hourly_rate, :city, :state, :language, presence: true
    validates :password, format: PASSWORD_REQ
    validates :email, uniqueness: true
    validates :hourly_rate, numericality: true
end
