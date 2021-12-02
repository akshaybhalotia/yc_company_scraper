# frozen_string_literal: true

require 'csv'
require 'json'

puts 'Converting essential data JSON to CSV'

CSV.open('./data/yc_essential_data.csv', 'w') do |csv|
  string_data = File.open('./data/yc_essential_data.json').read
  json_data = JSON.parse(string_data)
  csv << json_data.first.keys
  JSON.parse(string_data).each do |hash|
    csv << hash.values
  end
end

puts 'JSON to CSV conversion complete'
