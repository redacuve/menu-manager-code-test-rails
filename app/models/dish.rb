class Dish < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true, format: { with: /\A[^E]+\w+\z/i }, uniqueness: true
  validates :price, presence: true
end
