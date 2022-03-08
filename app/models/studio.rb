class Studio < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :styles
end
