module EndpointHelpers
  def api_endpoint
    # The http API endpoint for this service
    'https://poetrydb.org/'.freeze
  end

  # API Endpoint Helpers

  def get_poem_endpoint(title)
    "title/#{title}".freeze
  end
end
