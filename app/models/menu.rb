class Menu < ApplicationRecord
  has_many :dish
  validates :name, presence: true
  
  def prices
    dish.sum(:price)
  end
end
