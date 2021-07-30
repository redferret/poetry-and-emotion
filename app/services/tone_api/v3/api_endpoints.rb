Dir[Rails.root.join('app/services/tone_api/v3/api_calls/*.rb')].sort.each { |api_call| require api_call }

class ToneApi::V3::ApiEndpoints < ToneApi::V3::Client
  # API call modules
  extend GetTones
end
