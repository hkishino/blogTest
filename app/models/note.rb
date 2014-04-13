class Note < ActiveRecord::Base
  attr_accessible :memo, :title
  belongs_to :user
  scope :latest ,order('update_at desc')
end
