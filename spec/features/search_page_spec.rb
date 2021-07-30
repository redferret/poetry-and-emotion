require 'rails_helper'

RSpec.describe 'The search page' do
  before :all do
    poetry_mock_data = load_json('poem_data.json')
    stub_request(:get, 'https://poetrydb.org/author,poemcount/Emily;10')
      .with(headers: test_headers_for_poems).to_return(status: 200, body: poetry_mock_data, headers: {})

    tones_mock_data = load_json('tone_data.json')
    stub_request(:get, 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/d7ecd15c-2bef-4ec0-9e35-f588f6cb72ec/v3/tone?version=2017-09-21')
      .with(headers: test_headers_for_tones).to_return(status: 200, body: tones_mock_data, headers: {})
  end

  describe 'results' do
    it 'shows a list of poems 10 poems' do
      within '#poems' do
        expect(page).to have_selector('tr', count: 10)
      end
    end
    it 'shows the title, author, and the poem as a string, and the tones' do 
      within '#poem-1' do
        expect(page).to have_content('Not at Home to Callers')
        expect(page).to have_content('Emily Dickinson')
        expect(page).to have_content("Not at Home to Callers\nSays the Naked Tree --\nBonnet due in April --\nWishing you Good Day --\n")
        expect(page).to have_content('Joy, Analytical')
      end
    end
  end
end
