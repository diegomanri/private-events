class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :events, foreign_key: "creator_id"
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances
end
