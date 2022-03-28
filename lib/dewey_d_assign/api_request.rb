##
# Request to the OCLC classification API. See http://classify.oclc.org/classify2/api_docs/classify.html
# for details.
class DeweyDAssign::ApiRequest
	API_ENDPOINT = 'http://classify.oclc.org/classify2/Classify'
	ATTRS = %i(stdnbr oclc isbn issn upc ident heading owi author title summary max_recs order_by)
	attr_accessor(*ATTRS)

	##
	# Create new request with the +opts+ provided.
	#
	# All +opts+ must be one of the ones set by ATTRS. Any option not included in ATTRS is ignored.
	def initialize(opts = {})
		@summary = opts[:summary].nil? ? true : opts[:summary]
		@stdnbr = opts[:stdnbr]
		@oclc = opts[:oclc]
		@isbn = opts[:isbn]
		@issn = opts[:issn]
		@upc = opts[:upc]
		@ident = opts[:ident]
		@heading = opts[:heading]
		@owi = opts[:owi]
		@author = opts[:author]
		@title = opts[:title]
		@max_recs = opts[:max_recs]
		@order_by = opts[:order_by]
	end

	def uri
		URI.parse(to_s)
	end

	def to_s
		req = "#{API_ENDPOINT}?"
		req_params.each { |attr_name, value| req = "#{req}#{param_for(attr_name, value)}&" }
		req[0...-1]
	end

	private

	def req_params
		params = {}
		ATTRS.select { |attr_name| !self.send(attr_name).nil? }
			.map { |attr_name| params[attr_name] = self.send(attr_name).to_s }
		params
	end

	def param_for(attr_name, value)
		true_attr = attr_name.to_s.split('_')
			.inject([]) { |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }
			.join
		"#{true_attr}=#{value}"
	end
end