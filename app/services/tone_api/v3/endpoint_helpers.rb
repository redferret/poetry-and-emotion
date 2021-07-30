module EndpointHelpers
  def api_endpoint
    # The http API endpoint for this service
    'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/d7ecd15c-2bef-4ec0-9e35-f588f6cb72ec/'.freeze
  end

  # API Endpoint Helpers

  def get_tones_endpoint
    "v3/tone".freeze
  end
end
