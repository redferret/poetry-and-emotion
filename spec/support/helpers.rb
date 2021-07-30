module Helpers
  def load_json(file_name)
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end