module CoinMarketCap
  class TickerInfo
    def self.get_currency_details(currency_id)
      response = Request.where('/v1/cryptocurrency/quotes/latest', {id: currency_id})
      details = response.fetch("data").fetch("#{currency_id}")
      name = details.fetch("name")
      price = details.fetch("quote").fetch("USD").fetch("price")
      details = {:name => name, :price => price}
    end
  end
end
