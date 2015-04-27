class Casefile < ActiveRecord::Base
  has_many :hearings
 validates :CaseNumber ,:presence => true ,:length => { :minimum => 5 }
  validates :DateofFilling,:presence => true
  validates :Remarks,:presence => true
  validates :yearfiled,:presence => true
  has_many :payments
  has_many :trackers
  has_many :parties
  attr_accessible :CaseNumber, :CaseStatus, :CourtStation, :DateLastinCourt, :DateofFilling, :Parties, :Remarks, :Typeofcase, :natureofclaim, :yearfiled ,:plaintiff_advocate ,:defendant_advocate ,:periodlastaction
  t= Time.now
  c = Date.today
nextmonth = t+1.months
  scope :today,  lambda{includes(:hearings). where(:hearings =>{:dateofhearing=> Date.today})}
  scope :kesho,lambda{includes(:hearings).where(:hearings =>{:dateofhearing=> c.tomorrow })}
  scope :weekthis,lambda {includes(:hearings).where(:hearings =>{:dateofhearing=> t.beginning_of_week..t.end_of_week })}
  scope :monththis,lambda{includes(:hearings).where(:hearings =>{:dateofhearing=> t.beginning_of_month..t.end_of_month })}
end