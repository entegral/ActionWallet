article_list = [
  ["Orignal Bitcoin Whitepaper", "https://bitcoin.org/bitcoin.pdf"],
  ["Tron Black: Ravencoin - Getting Started", "https://medium.com/@tronblack/ravencoin-getting-started-96ab8e3e919b"],
  ["Tron Black: Ravencoin as an Asset Platform", "https://medium.com/@tronblack/ravencoin-as-an-asset-platform-6979530d125f"],
  ["Tron Black: Ravencoin Asset FAQ", "https://medium.com/@tronblack/ravencoin-asset-faq-e0d04d460e9b"],
  ["Tron Black: Seeds of Freedom", "https://medium.com/@tronblack/ravencoin-seeds-of-freedom-a3a3ff0fa1"],
  ["Ravencoin.org", "https://ravencoin.org"]
]

Article.destroy_all

article_list.each do |name, url|
  Article.create ({ :name => name, :url => url })
end

p "Created #{Article.count} article(s)"
