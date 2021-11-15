class Parent < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :caregivers, through: :jobs
    has_many :candidates, through: :jobs

    PASSWORD_REQ = /\A
    (?=.{8,}) # Minimum 8 characters
    (?=.*\d) # Contains at least one number
    (?=.*[a-z]) # Contains at least one lowercase letter
    (?=.*[A-Z]) # Contains at least one uppercase letter
    (?=.*[[:^alnum:]]) # Contains at least one symbol
    /x
    
    validates :password, :email, :first_name, :last_name, :hourly_rate, :city, :state, :language, :number_of_children, presence: true
    validates :password, format: PASSWORD_REQ
    validates :email, uniqueness: true
    validates :hourly_rate, numericality: true
end