require 'nokogiri'
require 'net/http'

class DeweyDAssign::ApiResponse
	attr_reader :code, :nsfa, :sfa, :xml

	def has_number?
		code == '0' || code == '2'
	end

	def self.submit_request(request)
		response = Net::HTTP.get_response(request.uri)
		raise DeweyDAssign::InvalidResponseError.new unless response.code == '200'
		self.new(response.body)
	end

	private

	def initialize(response_body)
		xml = Nokogiri::XML(response_body)
		xml.remove_namespaces!
		@xml = xml
		@code = xml.xpath('/classify/response[@code]').attr('code').value
		@nsfa = xml.xpath('/classify/recommendations/ddc/mostPopular').attr('nsfa')
		@sfa = xml.xpath('/classify/recommendations/ddc/mostPopular').attr('sfa')
	end
end