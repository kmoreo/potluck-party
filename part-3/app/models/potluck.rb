class Potluck < ActiveRecord::Base
  belongs_to :organizer, class_name: :User
  has_many :attendings
  has_many :guests, through: :attendings
end
