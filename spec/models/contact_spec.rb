require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "valid contact" do
    subject { create(:contact) }
    it { is_expected.to have_attributes(first_name: "John",
                                        last_name: "Smith",
                                        email_address: "john@gmail.com",
                                        phone_number: "1118675309",
                                        company_name: "John Smith LLC.")}
  end

  describe "relationships" do
    it "belongs to a user"
  end
end
