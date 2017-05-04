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

# Used to parse the IO object passed into the
# class #import method.
require 'csv'
# Normalizes the First name and Last name of
# the record before validations.
require 'capitalize_names'

class Contact < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name, 
                        :last_name, 
                        :email_address, 
                        :phone_number, 
                        :company_name, 
                        :user

  # Normalizes data before validating each record
  before_validation do |record|
    record.phone_number = normalize_phone_number
    record.first_name = normalize_name(record.first_name)
    record.last_name = normalize_name(record.last_name)
  end

  # Accepts an IO object and creates a separate 
  # Contact instance for each row in the document.
  # Expects that the IO object is a comma delimited
  # file with headers. Headers must include:
  # -First Name
  # -Last Name
  # -Email Address
  # -Phone Number
  # -Company Name
  # The user assigned to the record is the current
  # user, passed into the method as the second
  # argument.
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

  # Normalizes the name (String) argument by utilizing
  # the CapitializeNames gem
  def normalize_name(name)
    CapitalizeNames.capitalize(name)
  end

  # Normalizes the phone number (String) argument
  # by stripping out any extra characters and whitespace
  # leaving only a string of numbers followed by an
  # extension (denoted by an x) if one exists.
  def normalize_phone_number
    return "" unless phone_number
    phone_number.gsub(/\s|-|\.|\(|\)/, "").downcase
  end
end
