require 'faraday'
require 'json'

class Request
  class << self
    def where(resource_path, query = {}, pathway = {})
      response, status = get_json(resource_path, query, pathway)
      status == 200 ? response : errors(response)
    end
    def get(id)
      response, status = get_json(id)
      status == 200 ? response : errors(response)
    end
    def errors(response)
      error = { errors: { status: response["status"], message: response["message"]}}
      response.merge(error)
    end
    def get_json(root_path, query = {}, pathway = {})
      query_string = query.map{|k,v| "#{k}=#{v}"}.join("&")
      path = query.empty? ? root_path : "#{root_path}?#{query_string}"
      response = api(pathway).get(path)
      [JSON.parse(response.body), response.status]
    end
    def api(pathway)
      Connection.api(pathway)
    end
  end
end
