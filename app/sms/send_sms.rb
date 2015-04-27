module SendSms

	# Include the helper gateway class
	require_relative './AfricasTalkingGateway'

	def self.sms(mobile_number,message,courtstation)

	# Specify your login credentials
	username = "pngobiro";
	apikey   = "7e6a7c28a6e347199d24bcae67b3d00bfde4ac899279d45b17bb889b2b35f8ca";

	# Specify the numbers that you want to send to in a comma-separated list
	# Please ensure you include the country code (+254 for Kenya in this case)

        to = mobile_number
 	

	# And of course we want our recipients to know what we really do


	# Create a new instance of our awesome gateway class
	gateway = AfricasTalkingGateway.new(username, apikey)

	# Any gateway errors will be captured by our custom Exception class below,
	# so wrap the call in a try-catch block
	begin
	from = "HIGH_COURT"
	  # Thats it, hit send and we'll take care of the rest.
	  reports = gateway.send_message(to, message,from)
	  
	Sm.new do |c|
	c.station = courtstation
	c.sentmessage = message
	c.number = to
	c.save
	end

	rescue AfricasTalkingGatewayError => ex
	  puts 'Encountered an error: ' + ex.message
	end
end
end	# DONE!


