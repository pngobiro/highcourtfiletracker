class Tracker < ActiveRecord::Base
  belongs_to :casefile
  validates :TakenBy,:presence => true 
    validates :JudgeMagistrate,:presence => true
     validates :Reason,:presence => true
  attr_accessible :Date, :DateIn, :DateofResult, :From, :JudgeMagistrate, :Reason, :Results, :TakenBy, :Time, :To,:Reamarks
end
