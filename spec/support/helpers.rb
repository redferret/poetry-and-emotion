module Helpers
  def load_json(file_name)
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
  def test_headers_for_tones
    {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization'=>'Basic YXBpa2V5OkpxVlYwSDBwbVlyTko1VTlhSXlKNk1JdGxWMTRwUUprSVdxbFN4bC1vTkJn',
      'User-Agent'=>'Faraday v1.5.1'
    }
  end
  def test_headers_for_poems
    {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v1.5.1'
    }
  end
end