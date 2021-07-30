require_relative 'endpoint_helpers'

class PoetryDbApi::V1::Client
  extend EndpointHelpers

  def self.client(params)
    # Additional params can be added here
    Faraday.new(
      url: poetrydb_api_endpoint,
      params: params
    )
  end

  def self.request(method = :get, endpoint = nil, params: {})
    raise 'API endpoint must be defined' if endpoint.nil?

    connection = client(params)

binding.pry

    @response = connection.send(method, endpoint)

    return parse_json if response_successful?

    raise "Status: #{@response.status}, Response: #{@response.body}"
  end

  def self.parse_json
    Oj.load(@response.body, symbol_keys: true)
  end

  def self.response_successful?
    @response.status == 200
  end

  private_class_method :parse_json, :response_successful?
end
