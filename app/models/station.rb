class Station

  def self.all
    conn = Faraday.new(url: 'https://api.data.gov/nrel/alt-fuel-stations/v1') do |faraday|
      faraday.params["api_key"] = ENV["api_key"]
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
