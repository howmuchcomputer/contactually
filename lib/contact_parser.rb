require 'csv'

class ContactParser
  def self.parse(io)
    csv = CSV.new(io) 
  end
end
