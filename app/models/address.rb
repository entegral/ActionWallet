class Address < ActiveRecord::Base
  belongs_to :account
  validates :account_id, :chain_index, :address_index, :presence => true
end
