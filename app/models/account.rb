class Account < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :name, :coin, :account_index, :presence => true
end
