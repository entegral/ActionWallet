module CoinMarketCap
  class TickerInfo
    def self.get_currency_details(currency_id)
      coin_market_pathway = {base: 'https://sandbox-api.coinmarketcap.com', key_link: 'X-CMC_PRO_API_KEY', key: 'd5a521bc-0fa5-4f29-8cc8-536713e5de51'}
      response = Request.where('/v1/cryptocurrency/quotes/latest', {id: currency_id}, coin_market_pathway)
      details = response.fetch("data").fetch("#{currency_id}")
      name = details.fetch("name")
      price = details.fetch("quote").fetch("USD").fetch("price")
      details = {:name => name, :price => price}
    end
  end
end
