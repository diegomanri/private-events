class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location

  belongs_to :creator, class_name: "User"

  has_many :attendances, foreign_key: "attended_event_id"

  has_many :attendees, through: :attendances

  def readable_date
    I18n.l date, format: :long
  end

  def self.upcoming
    where("date >= ?", DateTime.current)
  end

  def self.previous
    where("date < ?", DateTime.current)
  end  
end
