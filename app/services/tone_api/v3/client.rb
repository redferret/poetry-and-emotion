require_relative 'endpoint_helpers'

class ToneApi::V3::Client
  extend EndpointHelpers

  def self.client(params)
    # Additional params can be added here
    params['version'] = '2017-09-21'
    
    Faraday.new(
      url: api_endpoint,
      params: params
    ) do |connection|
      connection.basic_auth('apikey', ENV['tone_api_key'])
    end
  end

  def self.request(method = :get, endpoint = nil, params: {})
    raise 'API endpoint must be defined' if endpoint.nil?

    connection = client(params)

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
