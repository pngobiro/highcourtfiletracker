class Party < ActiveRecord::Base
  belongs_to :casefile
  attr_accessible :Age, :Contacts, :EmailAddress, :FullNames, :Gender, :LawFirmContacts, :LawFirmName, :Party, :TelephoneContacts
 
end
