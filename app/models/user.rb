class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :events, foreign_key: "creator_id"
end
