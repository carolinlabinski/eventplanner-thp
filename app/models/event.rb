class Event < ApplicationRecord
has_many :attendances
has_many :users, through: :attendances
validates :start_date,
    presence: true
validate: event_must_be_in_the_future
validates :duration, 
    numericality: { grater_than: 0 },
    presence: true
validate: duration_must_be_multiple_of_five
validates :title,
  length: { in: 5..140 },
  presence: true
validates :description,
  presence: true,
  length: { in: 20..1000 }
validates :price,
  numericality: { grater_than: 0 },
  numericality: { less_than: 1001 },
  presence: true
validates :location,
  presence: true



def duration_must_be_multiple_of_five
    unless duration % 5 == 0
      errors.add(:duration, "must be multiple of 5")
    end
  end

  def event_must_be_in_the_future
    start_date > Time.now
    errors.add(:start_date, "must be in the future")
  end

end
