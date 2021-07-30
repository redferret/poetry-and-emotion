Dir[Rails.root.join('app/services/poetry_db_api/v1/api_calls/*.rb')].sort.each { |api_call| require api_call }

class PoetryDbApi::V1::ApiEndpoints < PoetryDbApi::V1::Client
  # API call modules
  extend GetPoems
end
