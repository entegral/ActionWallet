require 'blockcypher'



class Account < ActiveRecord::Base
  belongs_to :user
  has_many :addresses
  validates :user_id, :name, :coin, :account_index, :presence => true

  def total
    block_cypher = BlockCypher::Api.new(currency:BlockCypher::BTC, network:BlockCypher::TEST_NET_3, api_token:"9883c337be71449c9df67696fa5e271f")

    total = 0.00000000
    self.addresses.each do |address|
      total += block_cypher.address_final_balance(address.public_address(self.user.master_key, true))
    end
    total/100000000.00000000
  end
end
