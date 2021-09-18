class Attendee < ApplicationRecord
    has_many :tickets
    has_many :events, through: :tickets
end