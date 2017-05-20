class Attending < ActiveRecord::Base
  belongs_to :potluck
  belongs_to :guest, class_name: :User

  validates_uniqueness_of :dish, scope: :potluck_id
end
