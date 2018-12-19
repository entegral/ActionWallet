require 'rails_helper'


describe ('Address') do

  describe ('#bip32_addres\'s') do
    it('returns a valid bitcoin public_key for either mainnet or testnet, used to derive a public address') do
      address = Address.new({chain_index: 0, address_index: 0})
      account = Account.new({user_id: 1, name: "test", coin: 0, account_index: 0})
      address.account = account
      expect(address.bip32_address).to(eq("m/44'/0'/0'/0/0"))
      expect(address.bip32_address(true)).to(eq("m/44'/1'/0'/0/0"))

    end
  end
end
