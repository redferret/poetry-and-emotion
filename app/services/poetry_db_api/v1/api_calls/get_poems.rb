module GetPoems
  def get_poems(author, count)
    request :get, get_poems_endpoint(author, count), params: {}
  end
end
