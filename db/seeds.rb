CSV.foreach("#{APP_ROOT}/country_coords.csv", col_sep: "\t", :headers => true, :header_converters => :symbol) do |row|
    p row[:short_name]
    Country.create(name: row[:short_name], latitude: row[:lat].to_i, longitude: row[:long].to_i)
end
