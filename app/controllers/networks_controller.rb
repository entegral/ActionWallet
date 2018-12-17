class NetworksController < ApplicationController
  def index
    @details = []
    @details.push(CoinMarketCap::TickerInfo.get_currency_details(2577))
    @details.push(CoinMarketCap::TickerInfo.get_currency_details(1))
  end
end
