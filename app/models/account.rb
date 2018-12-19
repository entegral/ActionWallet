class Account < ActiveRecord::Base
  belongs_to :user
  has_many :addresses
  validates :user_id, :name, :coin, :account_index, :presence => true
end
