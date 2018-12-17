article_list = [
  ["Orignal Bitcoin Whitepaper", "https://bitcoin.org/bitcoin.pdf"],
  ["Tron Black: Ravencoin - Getting Started", "https://medium.com/@tronblack/ravencoin-getting-started-96ab8e3e919b"],
  ["Tron Black: Ravencoin as an Asset Platform", "https://medium.com/@tronblack/ravencoin-as-an-asset-platform-6979530d125f"],
  ["Tron Black: Ravencoin Asset FAQ", "https://medium.com/@tronblack/ravencoin-asset-faq-e0d04d460e9b"],
  ["Tron Black: Seeds of Freedom", "https://medium.com/@tronblack/ravencoin-seeds-of-freedom-a3a3ff0fa1"],
  ["Ravencoin.org", "https://ravencoin.org"]
]
user_list = [
  ["user0", "pass"],
  ["user1", "pass"],
  ["user2", "pass"]
]
account_list = [
  ["1", "Savings0", "175", "0"],
  ["1", "Checking0", "175", "1"],
  ["2", "Savings1", "175", "0"],
  ["2", "Checking1", "175", "1"]
]

User.destroy_all
Article.destroy_all
Account.destroy_all

article_list.each do |name, url|
  Article.create ({ :name => name, :url => url })
end
user_list.each do |username, password|
  User.create ({ :username => username, :password => password })
end
account_list.each do |user_id, name, coin, account_index|
  Account.create ({ :user_id => user_id, :name => name, :coin => coin, :account_index => account_index })
end

p "Created #{Article.count} article(s)"
p "Created #{User.count} user(s)"
p "Created #{Account.count} account(s)"
