class Attending < ActiveRecord::Base
  belongs_to :potluck
  belongs_to :guest, class_name: :User
end
