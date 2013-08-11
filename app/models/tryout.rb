class Tryout < ActiveRecord::Base
  attr_accessible :address, :ages, :city, :contact, :date, :info, :state
  belongs_to :user

  validates :user_id, presence: true
  validates :date, presence: true
  validate :city, presence: true
  default_scope order: 'tryouts.created_at DESC'
end
