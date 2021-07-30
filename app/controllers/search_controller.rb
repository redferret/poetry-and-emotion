class SearchController < ApplicationController 
  def index
    @poems = PoetryDbApi::V1::ApiEndpoints.get_poems(params[:author], 10)
    @tones = @poems.map do |poem|
      tones = ToneApi::V3::ApiEndpoints.get_tones(poem[:lines].join('. '))[:document_tone][:tones]
      tones.reduce('') do |tones, tone|
        tones << tone[:tone_name] << ', '
        tones
      end
    end
  end
end