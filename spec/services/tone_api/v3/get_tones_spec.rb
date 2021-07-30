require 'rails_helper'

RSpec.describe ToneApi::V3::ApiEndpoints do
  describe 'get_tones' do
    it 'returns expected data when successful' do
      mock_data = load_json('tone_data.json')
      stub_request(:get, 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/d7ecd15c-2bef-4ec0-9e35-f588f6cb72ec/v3/tone?version=2017-09-21')
       .with(headers: test_headers_for_tones).to_return(status: 200, body: mock_data, headers: {})

      response = ToneApi::V3::ApiEndpoints.get_tones

      expect(response).to have_key(:document_tone)
      document_tone = response[:document_tone]
      expect(document_tone).to have_key(:tones)
      expect(document_tone[:tones][0]).to have_key(:score)
      expect(document_tone[:tones][0]).to have_key(:tone_name)
    end
  end
end
