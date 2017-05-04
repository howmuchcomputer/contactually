require 'csv'

class Contact < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name, 
                        :last_name, 
                        :email_address, 
                        :phone_number, 
                        :company_name, 
                        :user

  def self.import(file, user_id)
    CSV.foreach(file, headers: true) do |row|
      create(
        first_name: row["First Name"],
        last_name: row["Last Name"],
        email_address: row["Email Address"],
        phone_number: row["Phone Number"],
        company_name: row["Company Name"],
        user_id: user_id
      )
    end
  end

  private

  def normalize_phone_number(phone_number)
    phone_number.gsub!(/\s|-|\(|\)/, "").downcase!
    full_num, extension = phone_number.split("x")
    if full_num.length > 10
      num = full_num.split("").last(10).join
      country_code = full_num[0...(full_num.length - 10)]
      [country_code, num, extension.to_s].join("#")
    else
      [full_num, extension.to_s].join("#")
    end
  end
end
