class Address < ActiveRecord::Base
  belongs_to :account
  validates :account_id, :chain_index, :address_index, :presence => true

  def bip32_address(isTest = false)
    coin = isTest ? 1 : account.coin
    "m/44'/#{coin}'/#{account.account_index}'/#{chain_index}/#{address_index}"
  end

  def public_address(master_key, isTest = false)
    master = MoneyTree::Master.new seed_hex: master_key
    node = master.node_for_path bip32_address(isTest)
    node.to_address
  end
end
