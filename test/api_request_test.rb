require "test_helper"

class ApiRequestTest < Minitest::Test
  def test_has_correct_host
    req = DeweyDAssign::ApiRequest.new
    assert req.to_s.include?('http://classify.oclc.org/classify2/Classify')
  end

  def test_has_summary_setting
    assert DeweyDAssign::ApiRequest.new.to_s.include?('summary=true')
    assert DeweyDAssign::ApiRequest.new(summary: false).to_s.include?('summary=false')
  end
end
