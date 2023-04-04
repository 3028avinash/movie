class User < ApplicationRecord
    has_secure_password
    has_many :movies, dependent: :nullify
    has_many :reviews, dependent: :nullify
    validates :email, presence: true, uniqueness: true




end
