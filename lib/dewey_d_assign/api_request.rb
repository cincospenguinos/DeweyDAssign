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

	attr_accessor :stdnbr
	attr_accessor :oclc
	attr_accessor :isbn
	attr_accessor :issn
	attr_accessor :upc
	attr_accessor :ident
	attr_accessor :heading
	attr_accessor :owi
	attr_accessor :author
	attr_accessor :title
	attr_accessor :summary
	attr_accessor :max_recs
	attr_accessor :order_by

	def initialize(opts = {})
	end

	def to_s
		API_ENDPOINT
	end
end