class Payment < ActiveRecord::Base
  belongs_to :casefile
  attr_accessible :amount, :dateofpayment, :paidby, :typeofpayment
end
