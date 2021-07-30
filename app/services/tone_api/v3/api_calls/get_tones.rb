module GetTones
  def get_tones(text)
    request :get, get_tones_endpoint, params: {
      text: text
    }
  end
end
