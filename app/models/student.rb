class Student < ActiveRecord::Base
    has_secure_password 
    has_many :classes 
    validates :username, presence: true
    validates :username, uniqueness: true 
    validates :email, presence: true 
    validates :password, presence: true 


    end