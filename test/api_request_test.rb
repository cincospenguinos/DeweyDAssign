require "test_helper"

class ApiRequestTest < Minitest::Test
  def test_has_correct_host
    req = DeweyDAssign::ApiRequest.new
    assert req.to_s.include?('http://classify.oclc.org/classify2/Classify')
  end
end
