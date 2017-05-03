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
