CSV.foreach("#{APP_ROOT}/country_coords.csv", col_sep: "\t", :headers => true, :header_converters => :symbol) do |row|
    Country.create(name: row[:short_name], latitude: row[:lat].to_i, longitude: row[:long].to_i)
end


CSV.foreach("#{APP_ROOT}/state_latlon.csv", :headers => true, :header_converters => :symbol) do |row|
    State.create(name: row[:name], abbreviation: row[:state], latitude: row[:latitude].to_i, longitude: row[:longitude].to_i)
end
