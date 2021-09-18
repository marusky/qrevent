class Event < ApplicationRecord
    belongs_to :user
    has_many :tickets, dependent: :destroy
    has_many :attendees, through: :tickets, dependent: :destroy
    validates :name, presence: true
    validates :date, presence: true
    validates :time, presence: true
end
