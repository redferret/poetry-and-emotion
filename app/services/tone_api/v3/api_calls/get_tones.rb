module GetTones
  def get_tones
    request :get, get_tones_endpoint, params: {}
  end
end
