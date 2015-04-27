class CaseFile < ActiveRecord::Base
  has_many :trackers
  attr_accessible :CaseNumber, :CaseParties, :CaseStatus, :CourtStation, :DateLastinCourt, :DateofFilling, :DateofLastAction, :PrayersSought, :Remarks, :TypeofCase
end
