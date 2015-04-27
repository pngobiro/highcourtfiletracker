class Hearing < ActiveRecord::Base
  belongs_to :casefile
    validates :dateofhearing,:presence => true
  attr_accessible :Remarks, :court, :dateofhearing, :judge

end
