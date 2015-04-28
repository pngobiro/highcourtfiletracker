class Batch < ActiveRecord::Base

#Callbacks
before_save :set_batch_name
after_save :createmovements, :if => :outcome_nil 
after_update :updatemovements, :unless => :outcome_nil

#Validations
validates :officer_taking_action,:presence => true
validates :destination,:presence => true
validates :outcome,:presence => true,:on => :update
validates :result_date ,:presence => true,:on => :update


#Relationships
	belongs_to :courtstation
  	has_many :batchships
	has_many :casefiles,through: :batchships

#Attributes
 attr_accessible :casefile_ids, :batch_name, :category, :date_out, :from, :officer_taking_action, :outcome, :reason, :reason_for_rejection, :recordcreatedby, :recordupdatedby, :remarks, :result_date, :destination
validates :casefile_ids ,:presence => true 

# Set Batch Name based on Reason and Date or Outcome and date
def set_batch_name
if outcome_nil
self.batch_name = "#{self.reason} on #{self.date_out}"
else
self.batch_name = "#{self.outcome} on #{self.result_date}"
end
end


# Create Custom Message Based on Matter Outcome 
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

# option for blank outcome.
def outcome_nil
 outcome.blank?||result_date.blank?
end

# Create New File Movemet and Send SMS.
def createmovements
court  = Courtstation.find(courtstation_id)
courtstation = court.name.upcase
ids = casefile_ids
ids.each do |h|
c = Casefile.find(h)
casenum = c.casenumber.upcase
deceased= c.parties_names.upcase
mobile_number = c.mobile_num
y= c.movements.build do |y|
y.category = category
y.date_out = date_out
y.from = from
y.destination = destination
y.officer = officer_taking_action
y.reason = reason
y.save
c.caseindex = y.id
if outcome.blank?
c.casestatus= "#{reason} on #{date_out}"
else
c.casestatus = "#{outcome} on #{result_date}"
end
c.save
message = "#{courtstation}.Matter: #{casenum}.Deceased : #{deceased}. #{reason} on #{date_out}"
SendSms.sms(mobile_number,message,courtstation) unless mobile_number.blank?
end

end
end

# Get the Last Movements , update File Movement and Send SMS .
def updatemovements
court  = Courtstation.find(courtstation_id)
courtstation = court.name.upcase
ids = casefile_ids
ids.each do |w|
c = Casefile.find(w)
casenum = c.casenumber.upcase
deceased = c.parties_names.upcase
mobile_number = c.mobile_num
caseindex = c.caseindex
m = c.movements.find(caseindex)
m.update_attributes(:outcome => outcome,:result_date => result_date,:reason_for_rejection =>reason_for_rejection,:remarks => remarks)
m.save 
if outcome.blank?
c.casestatus= "#{reason} on #{date_out}"
else
c.casestatus = "#{outcome} on #{result_date}"
end
c.save
message = "#{courtstation}.Matter: #{casenum}.Deceased : #{deceased}.#{outcome} #{reason_for_rejection} on #{result_date}.#{custom_message}"
SendSms.sms(mobile_number,message,courtstation) unless mobile_number.blank?
end
end


end
