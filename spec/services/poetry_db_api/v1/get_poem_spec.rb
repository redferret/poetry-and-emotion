require 'rails_helper'

RSpec.describe PoetryDbApi::V1::ApiEndpoints do
  describe 'get_poem' do
    it 'returns expected data when successful' do
      mock_data = load_json('poem_data.json')
      stub_request(:get, 'https://poetrydb.org/author,poemcount/Emily;10')
       .with(headers: test_headers_for_poems).to_return(status: 200, body: mock_data, headers: {})

      response = PoetryDbApi::V1::ApiEndpoints.get_poems('Emily', 10)

      expect(response[0]).to have_key(:title)
      expect(response[0]).to have_key(:author)
      expect(response[0]).to have_key(:lines)
    end
  end
end
