class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location

  belongs_to :creator, class_name: "User"

  def readable_date
    I18n.l date, format: :long
  end
end
