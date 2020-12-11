class Student < ActiveRecord::Base
    has_secure_password 
    has_many :courses  
    validates :username, presence: true
    validates :username, uniqueness: true 
    validates :email, presence: true 
    


    end