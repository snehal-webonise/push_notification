module CreateNotification
  def get_flight_details
    params = File.read("#{Rails.root}/public/delay_notification.json")
    inremediate_json = params.to_s.gsub('=>',':')
    final_json = inremediate_json.to_s.gsub('"nil"','nil').to_s.gsub('nil','"nil"')
    data = JSON.parse(final_json)


    departure_airport =  data['alert']['flightStatus']['departureAirportFsCode']
    arrival_airport  = data['alert']['flightStatus']['arrivalAirportFsCode']
    departure_delay = data['alert']['flightStatus']['delays']['departureGateDelayMinutes']
    arrival_delay = data['alert']['flightStatus']['delays']['arrivalGateDelayMinutes']
    departureGate = data['alert']['flightStatus']['airportResources']['departureGate']
    arrivalGate = data['alert']['flightStatus']['airportResources']['arrivalGate']


    gate_msg_array = []
    gate_msg_array << "Arrival gate : #{arrivalGate}" unless arrivalGate.blank?
    gate_msg_array << "Departure gate : #{departureGate}" unless departureGate.blank?
    gate_msg = gate_msg_array.join(" And ")

    msg_array = []
    msg_array <<  "Departure airport code : #{departure_airport}" unless departure_airport.blank?
    msg_array <<  "Arrival airport code : #{arrival_airport}" unless arrival_airport.blank?
    msg_array << "Departure delay is #{departure_delay} minutes" unless departure_delay.blank?
    msg_array << "Arrival delay is #{arrival_delay} minutes" unless arrival_delay.blank?
    msg_array << gate_msg


    msg = msg_array.join(" \r\n ")
    logger.info"##########msg#############{msg.inspect}"
    return msg
  end
end