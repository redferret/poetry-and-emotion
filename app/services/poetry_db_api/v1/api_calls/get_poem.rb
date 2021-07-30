module GetPoem
  def get_poem(title)
    request :get, get_poem_endpoint(title), params: {}
  end
end
