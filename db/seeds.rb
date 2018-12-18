article_list = [
  ["Orignal Bitcoin Whitepaper", "https://bitcoin.org/bitcoin.pdf"],
  ["Tron Black: Ravencoin - Getting Started", "https://medium.com/@tronblack/ravencoin-getting-started-96ab8e3e919b"],
  ["Tron Black: Ravencoin as an Asset Platform", "https://medium.com/@tronblack/ravencoin-as-an-asset-platform-6979530d125f"],
  ["Tron Black: Ravencoin Asset FAQ", "https://medium.com/@tronblack/ravencoin-asset-faq-e0d04d460e9b"],
  ["Tron Black: Seeds of Freedom", "https://medium.com/@tronblack/ravencoin-seeds-of-freedom-a3a3ff0fa1"],
  ["Ravencoin.org", "https://ravencoin.org"]
]
user_list = [
  ["Rohan", "pass", "obtain occur ivory sure hundred mask oil slot fatal vault swamp swamp", true],
  ["Rob", "pass", "glory people gallery position gold unique clean owner tired shine limit dignity", true],
  ["Daniel", "pass", "useless busy action lizard school buyer supply hour iron royal rib table", true],
  ["Phil", "pass", "else soft butter fruit lottery like unable nuclear retreat wasp armed idle", true]
]
account_list = [
  ["1", "Deposit", "1", "0"],
  ["2", "Deposit", "1", "0"],
  ["3", "Deposit", "1", "0"],
  ["4", "Deposit", "1", "0"]
]


User.destroy_all
Article.destroy_all
Account.destroy_all

article_list.each do |name, url|
  Article.create ({ :name => name, :url => url })
end
user_list.each do |username, password, words, confirmed|
  key = words ? BipMnemonic.to_seed(mnemonic: words) : nil
  User.create ({ :username => username, :password => password, :master_key => key, :confirmed => confirmed })
end
account_list.each do |user_id, name, coin, account_index|
  Account.create ({ :user_id => user_id, :name => name, :coin => coin, :account_index => account_index })
end

p "Created #{Article.count} article(s)"
p "Created #{User.count} user(s)"
p "Created #{Account.count} account(s)"
