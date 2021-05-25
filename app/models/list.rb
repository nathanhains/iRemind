class List < ApplicationRecord
    has_many :reminders
    validates :name, presence: true
    validates :color, presence: true
end
