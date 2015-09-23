class Pin < ActiveRecord::Base
  belongs_to :user
  validates :sim_number, presence:true
end