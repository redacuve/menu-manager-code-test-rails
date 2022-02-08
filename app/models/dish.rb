class PriceValidator < ActiveModel::Validator
  def validate(record)
    if record.price && record.menu_id && (record.menu.prices + record.price) == 77
      record.errors.add :base, "The sum of the prices of the dishes are exactly 77"
    end
  end
end

class Dish < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true, format: { with: /\A[^E]+\w+\z/i }, uniqueness: true
  validates :price, presence: true
  validates_with PriceValidator, fields: [:price]
end
