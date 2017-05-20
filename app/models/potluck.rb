class Potluck < ActiveRecord::Base
  belongs_to :organizer, class_name: :User
  has_many :attendings
  has_many :guests, through: :attendings

  validates_presence_of :name, :location, :start_time, :organizer_id #added after final push
end
