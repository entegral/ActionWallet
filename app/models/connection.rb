require 'faraday'
require 'json'

class Connection
  # BASE = 'https://sandbox-api.coinmarketcap.com'
  def self.api(params)
    Faraday.new(url: params.fetch(:base)) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers["#{params.fetch(:key_link)}"] = params.fetch(:key)
    end
  end
end

# 'X-CMC_PRO_API_KEY'
# 'd5a521bc-0fa5-4f29-8cc8-536713e5de51'
