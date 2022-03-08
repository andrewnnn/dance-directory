class Review < ApplicationRecord
  belongs_to :studio

  validates :stars, presence: true
end
