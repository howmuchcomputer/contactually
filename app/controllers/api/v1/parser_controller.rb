class Api::V1::ParserController < Api::V1::BaseController
	def parse
		parser = ContactParser.parse(params[:contacts].read)
    binding.pry
	end
end
