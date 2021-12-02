# frozen_string_literal: true

require 'json'

puts 'Initiating local processing'

Dir.mkdir('./data') unless Dir.exist?('./data')

path = './responses'
File.write('./data/combined_companies_data.json', '')
File.write('./data/combined_companies_data.json', '[', mode: 'a')
Dir.children(path).each do |file|
  next if file == 'yc_batches.json'

  puts "Processing #{file}"
  file_data = File.read("#{path}/#{file}")
  data = JSON.parse(file_data)
  useful_data = data['results'][0]['hits']
  array_items = if file == Dir.children(path).first
                  (JSON.generate(useful_data)[1...-1]).to_s
                else
                  ",#{JSON.generate(useful_data)[1...-1]}"
                end
  File.write('./data/combined_companies_data.json', array_items, mode: 'a')
  puts "Processed #{file}"
end
File.write('./data/combined_companies_data.json', ']', mode: 'a')

puts 'All data combined into single JSON'
