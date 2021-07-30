module EndpointHelpers
  def poetrydb_api_endpoint
    # The http API endpoint for this service
    'https://poetrydb.org/'.freeze
  end

  # API Endpoint Helpers

  def get_poems_endpoint(author, count)
    "author,poemcount/#{author};#{count}".freeze
  end
end
