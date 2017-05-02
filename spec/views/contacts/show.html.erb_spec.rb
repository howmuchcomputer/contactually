require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email_address => "Email Address",
      :phone_number => "Phone Number",
      :company_name => "Company Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email Address/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Company Name/)
  end
end
