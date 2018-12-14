module CoinMarketCap
  class TickerInfo
    MAX_LIMIT = 10
    attr_accessor :transactions
    def initialize(args = {})
      super(args)
      self.transactions = parse_transactions(args)
    end

    def parse_transactions(args = {})
      params.fetch("data").fetch("market_pairs").each do |market_pair|
    end
  end
end
