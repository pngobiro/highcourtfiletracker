class Movement < ActiveRecord::Base
  before_save :insert_createdby, :if => :new_record? 
  belongs_to :casefile
 validates :to,:presence => true  
 validates :officer,:presence => true
 validates :reason,:presence => true
 validates :category,:presence => true,:length => { :minimum => 5 }
 #validates :results,:presence => true,:on => :update
 #validates :dateofresult,:presence => true,:on => :update

 attr_accessible :date, :datein, :dateofresult, :from, :category,:officer, :reason,:result_reason,:reasonforadjournment, :recordcreatedby, :recordupdatedby, :remarks, :tel,:results, :station, :takenby, :time, :to

scope :none, lambda { where(:id => -1)}

# Insert the name of staff who created the record
def insert_createdby
self.recordcreatedby = User.current_user.username
end

# Update The File Status

def set_casefile_casestatus
if self.results.blank?
casefile.casestatus = "#{self.reason} on #{self.date_out}"
else
casefile.casestatus = "#{self.results} on #{self.dateofresult}"
end
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

end

