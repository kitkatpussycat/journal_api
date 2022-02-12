class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy

    validates :name, presence: true

    def as_json(options={})
        super(include: :tasks)
    end
end
