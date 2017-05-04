# == Schema Information
#
# Table name: contacts
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  email_address :string
#  phone_number  :string
#  company_name  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "valid contact" do
    subject { create(:contact) }
    it { is_expected.to have_attributes(first_name: "John",
                                        last_name: "Smith",
                                        email_address: "john@gmail.com",
                                        phone_number: "1118675309",
                                        company_name: "John Smith LLC.")}

    describe "relationships" do
      it "belongs to a user" do
        expect(subject.user).to be_kind_of(User)
      end
    end

    describe "validations" do
      it "normalizes phone numbers" do
        contact = create(:contact, phone_number: "1(410)-222-5555")
        expect(contact.phone_number).to eq "14102225555"
      end  

      it "normalizes first names" do
        contact = create(:contact, first_name: "JoHn O'NEILL")
        expect(contact.first_name).to eq "John O'Neill" 
      end

      it "normalizes last names" do
        contact = create(:contact, last_name: "macarthur")
        expect(contact.last_name).to eq "MacArthur" 
      end
    end
  end
end
