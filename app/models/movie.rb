class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user
    has_one_attached :image 
    validates :name, presence: true
    def list_movie
        @list = Movie.all
    end

end
