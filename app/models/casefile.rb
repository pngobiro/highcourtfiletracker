class Casefile < ActiveRecord::Base

# Has many movements

has_many :movements
  has_many :batchships
  has_many :batches, through: :batchships
# Belongs to a particular station

belongs_to :courtstation

# Read and write the following fields;
 attr_accessible :typeofcase, :casenumber, :caseindex,:deathcertnumber,:deathcertserial,:casestatus, :approvaldate,:gazettenoticedate,:objectiondate,:grantissueddate, :grantconfirmeddate, :datelastincourt, :dateoffilling, :parties_names,:parties_names_b,:deceasedcitizenship,:deceasedresidence,:deceasedplaceofdeath,:deceaseddateofdeath,:remarks, :natureofclaim, :yearfiled,:mobile_num,:recordcreatedby,:recordupdatedby
 
# Require the Presence of the following;

validates :casenumber ,:presence => true ,:length => { :minimum => 5 }

# validates :dateoffilling,:presence => true

validates :yearfiled,:presence => true,:length => { :minimum => 4 }

# validates :typeofcase,:presence => true,:length => { :minimum => 3 }

validates :parties_names,:presence => true,:length => { :minimum => 10 } # To change to deceasedname

validates :natureofclaim,:presence => true,:length => { :minimum => 2 }

# Death Certificate serial number Must be included;

#validates :deathcertserial,:presence => true ,:length => { :minimum => 5 }#,:message => "You Must Include Death Cerificate Serial Number"

# Death Certificate Number Must be included;

#validates :deathcertnumber ,:presence => true ,:length => { :minimum => 5 }#,:message => "You Must Include Death Cerificate Number"

# Hack to  Load empty (Prevent Pulling of all records)Table at the Loading of Index Page;

scope :none, lambda { where(:id => -1)}

def self.station_records
a = Casefile.where(courtstation_id: User.current_user.courtstation_id)
end
def casenumber_deceasedname
"#{casenumber} - #{parties_names}"
end
end
