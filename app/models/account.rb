class Account < ActiveRecord::Base
  validates :user_id, :name, :coin, :account_index, :presence => true
end
