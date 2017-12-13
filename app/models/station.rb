class Station

  def self.all(zip)
    conn = Faraday.new(url: 'https://api.data.gov/nrel/alt-fuel-stations/v1/') do |faraday|
      faraday.params["api_key"] = ENV["api_key"]
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get do |req|
      req.url 'nearest'
      req.params['format']    = "json"
      req.params['fuel_type'] = "ELEC"
      req.params['fuel_type'] = "LPG"
      req.params['radius']    = 6.0
      req.params['limit']     = 10
      req.params['location']  = zip
    end
    stations = JSON.parse(response.body)["fuel_stations"]
    stations.map do |station|
      Station.new(station)
    end
  end

  def initialize(station)
    @name         = station["station_name"]
    @address      = station["street_address"]
    @fuel_type    = station["fuel_type_code"]
    @distance     = station["distance"]
    @access_times = station["access_days_time"]
  end

  attr_reader :name, :address, :fuel_type, :distance, :access_times
end
