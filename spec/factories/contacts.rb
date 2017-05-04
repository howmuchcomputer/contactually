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

FactoryGirl.define do
  factory :contact do
    first_name "John"    
    last_name "Smith"
    email_address "john@gmail.com"
    phone_number "1118675309"
    company_name "John Smith LLC."
    user 
  end
end
