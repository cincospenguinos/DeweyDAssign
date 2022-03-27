# stdnbr	(Optional)
#  	The standard number (OCLC, ISBN, ISSN, UPC) number to search for.
# oclc	(Optional)
#  	The OCLC number to search for.
# isbn	(Optional)
#  	The ISBN to search for.
# issn	(Optional)
#  	The ISSN to search for.
# upc	(Optional)
#  	The UPC code to search for.
# ident	(Optional)
#  	The FAST identifier to search for.
# heading	(Optional)
#  	The FAST heading to search for.
# owi	(Optional)
#  	The OCLC work identifier to search for.
# author	(Optional)
#  	The author name to search for.
# title	(Optional)
#  	The title to search for.
# summary	(Required)
#  	A boolean operator to produce a summary-only response. Valid entries are 'true' and 'false'. The default value is false (detailed response).
# maxRecs	(Optional)
#  	The number of records to be returned.
# orderBy	(Optional)
#  	The desired sort order. Valid entried are:
#  	-- mancount asc (number of editions, ascending)
#  	-- mancount desc (number of editions descending)
#  	-- hold asc (holdings, ascending)
#  	-- hold desc (holdings, descending)
#  	-- lyr asc (date of first edition, ascending)
#  	-- lyr desc (date of first edition, descending)
#  	-- hyr asc (date of latest edition, ascending)
#  	-- hyr desc (date of latest edition, descending)
#  	-- ln asc (language, ascending)
#  	-- ln desc (language, descending)
#  	-- sheading asc (FAST subject heading, ascending)
#  	-- sheading desc (FAST subject heading, descending)
#  	-- works asc (number of works with this FAST subject heading, ascending)
#  	-- works desc (number of works with this FAST subject heading, descending)
#  	-- type asc (FAST subject type, ascending)
#  	-- type desc (FAST subject type, descending)
class DeweyDAssign::ApiRequest
	API_ENDPOINT = 'http://classify.oclc.org/classify2/Classify'
	ATTRS = %i(stdnbr oclc isbn issn upc ident heading owi author title summary max_recs order_by)
	attr_accessor(*ATTRS)

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