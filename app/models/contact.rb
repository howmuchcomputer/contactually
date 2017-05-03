class Contact < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name, 
                        :last_name, 
                        :email_address, 
                        :phone_number, 
                        :company_name, 
                        :user
end
