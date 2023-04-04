class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    delegate :list_movie, to: :movie
    validates :review, :rate, presence: true
end
