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
    if isTest
      node.to_address(true, network: :bitcoin_testnet)
    else
      node.to_address
    end
  end

  def total
    block_cypher = BlockCypher::Api.new(currency:BlockCypher::BTC, network:BlockCypher::TEST_NET_3, api_token:"9883c337be71449c9df67696fa5e271f")

    total = block_cypher.address_final_balance(public_address(self.account.user.master_key, true))
    total/100000000.00000000
  end

end
