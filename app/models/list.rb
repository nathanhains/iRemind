class List < ApplicationRecord
    has_many :reminders, :dependent => :delete_all
    validates :name, presence: true
    validates :color, presence: true
end
