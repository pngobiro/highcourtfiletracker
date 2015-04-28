class Movement < ActiveRecord::Base
  before_save :insert_createdby, :if => :new_record? 
  belongs_to :casefile

  after_save :send_sms,:update_casefile_status
  

 validates :destination,:presence => true  
 validates :officer,:presence => true
 validates :reason,:presence => true
 validates :category,:presence => true,:length => { :minimum => 5 }

 #validates :outcome,:presence => true,:on => :update
 #validates :result_date,:presence => true,:on => :update

 attr_accessible :date_out, :datein, :result_date, :from, :category,:officer, :reason,:reason_for_rejection, :recordcreatedby, :recordupdatedby, :remarks,:outcome, :takenby, :time, :destination

scope :none, lambda { where(:id => -1)}

# Update The File Status
def update_casefile_status
reason = self.reason
date_out = self.date_out
outcome = self.outcome
result_date = self.result_date

if self.outcome.blank?
casefile.casestatus= "#{reason} on #{date_out}"
else
casefile.casestatus = "#{outcome} on #{result_date}"
end
end



# Insert the name of staff who created the record
def insert_createdby
self.recordcreatedby = User.current_user.username
end





def self.categories
['Approvals','Signing of Grants','Gazettement','Certifications']
end

def self.reasons
['Going for Matter Approval','Going for Signing of Grant','Going for Gazettement','Going for Certification']
end

def self.outcome
['Matter Approved','Matter Not Approved','Grant Signed','Matter Gazzeted', 'Matter Certified']
end

def self.options_for_category
Movement.pluck(:category).uniq
end


def send_sms
mobile_number = casefile.mobile_num
courtstation = casefile.courtstation.name
casenum = casefile.casenumber
deceased = casefile.parties_names
reason = self.reason
date_out =  self.date_out
outcome = self.outcome
reason_for_rejection = self.reason_for_rejection
result_date  = self.result_date
new_message = "#{courtstation}.Matter: #{casenum}.Deceased : #{deceased}. #{reason} on #{date_out}"
update_message= "#{courtstation}.Matter: #{casenum}.Deceased : #{deceased}.#{outcome} #{reason_for_rejection} on #{result_date}.#{custom_message}"

if outcome_nil
message = new_message
SendSms.sms(mobile_number,message,courtstation) unless mobile_number.blank?
elsif
message = update_message
SendSms.sms(mobile_number,message,courtstation) unless mobile_number.blank?
end

end


def custom_message
case outcome
when 'Matter Not Approved'
'Kindly Make the Necessary Corrections'
when 'Grant Signed'
'Kindly come and collect it'
else
  ''
end
end


def outcome_nil
 outcome.blank?||result_date.blank?
end

end

