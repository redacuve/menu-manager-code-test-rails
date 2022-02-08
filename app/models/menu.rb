class Menu < ApplicationRecord
  has_many :dish
  validates :name, presence: true
end
