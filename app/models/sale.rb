class Sale < ApplicationRecord
  validates :detail, presence: true
  validates :cod, uniqueness: true

end
