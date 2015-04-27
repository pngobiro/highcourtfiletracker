class DashboardController < ApplicationController
 def audit
 	@changes = Audit.trackertype.order_latest
 end 
 def mini_dashboard

end

end
