article_list = [
  ["Orignal Bitcoin Whitepaper", "https://bitcoin.org/bitcoin.pdf"]
]
article_list.each do |name, url|
  Article.create ({ :name => name, :url => url })
end

p "Created #{Article.count} article(s)"
