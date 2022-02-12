class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates_date :date, on_or_after: :today, on: :create
end
