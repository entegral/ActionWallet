require 'faraday'
require 'json'

class Connection
  def self.api(params)
    Faraday.new(url: params.fetch(:base)) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers["#{params.fetch(:key_link)}"] = params.fetch(:key)
    end
  end
end
