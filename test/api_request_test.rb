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

  def test_has_stdnbr
    assert DeweyDAssign::ApiRequest.new(stdnbr: 'foo').to_s.include?('stdnbr=foo')
  end

  def test_does_not_have_stdnbr_where_none_given
    refute DeweyDAssign::ApiRequest.new.to_s.include?('stdnbr')
  end

  def test_does_not_end_with_ampersand
    refute DeweyDAssign::ApiRequest.new.to_s.end_with?('&')
  end
end
