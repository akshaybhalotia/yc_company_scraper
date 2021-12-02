# frozen_string_literal: true

require 'uri'
require 'json'
require 'net/http'

url = URI('https://45bwzj1sgc-dsn.algolia.net/1/indexes/*/queries?x-algolia-agent=Algolia%20for%20JavaScript%20(3.35.1)%3B%20Browser%3B%20JS%20Helper%20(3.4.4)&x-algolia-application-id=45BWZJ1SGC&x-algolia-api-key=Zjk5ZmFjMzg2NmQxNTA0NGM5OGNiNWY4MzQ0NDUyNTg0MDZjMzdmMWY1NTU2YzZkZGVmYjg1ZGZjMGJlYjhkN3Jlc3RyaWN0SW5kaWNlcz1ZQ0NvbXBhbnlfcHJvZHVjdGlvbiZ0YWdGaWx0ZXJzPSU1QiUyMnljZGNfcHVibGljJTIyJTVEJmFuYWx5dGljc1RhZ3M9JTVCJTIyeWNkYyUyMiU1RA%3D%3D')

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request[
  'Connection'
    ] = 'keep-alive'
request[
  'accept'
] = 'application/json'
request[
  'User-Agent'
] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
request[
  'content-type'
] = 'application/x-www-form-urlencoded'
request[
  'Sec-GPC'
] = '1'
request[
  'Origin'
] = 'https://www.ycombinator.com'
request[
  'Sec-Fetch-Site'
] = 'cross-site'
request[
  'Sec-Fetch-Mode'
] = 'cors'
request[
  'Sec-Fetch-Dest'
] = 'empty'
request[
  'Referer'
] = 'https://www.ycombinator.com/'
request[
  'Accept-Language'
] = 'en-GB,en-US;q=0.9,en;q=0.8'

Dir.mkdir('./responses') unless Dir.exist?('./responses')

puts 'Looking for batches'
request.body = JSON.generate({
                               "requests": [{ "indexName": 'YCCompany_production',
                                              "params": 'query=&hitsPerPage=1&attributesToRetrieve=%5B%5D&attributesToHighlight=%5B%5D&analytics=false&facets=%5B%22top_company%22%2C%22isHiring%22%2C%22nonprofit%22%2C%22batch%22%2C%22industries%22%2C%22subindustry%22%2C%22status%22%2C%22regions%22%5D&sortFacetValuesBy=count' }]
                             })

response = https.request(request)
data = JSON.parse(response.read_body)
batches = data['results'][0]['facets']['batch'].keys
File.write('./responses/yc_batches.json', JSON.generate(batches))
puts 'Batches found'

file = File.read('./responses/yc_batches.json')
batches = JSON.parse(file)
batches.each do |batch|
  puts "Requesting #{batch} data"
  request.body = JSON.generate({
                                 "requests": [
                                   {
                                     "indexName": 'YCCompany_production',
                                     "params": "hitsPerPage=1000&query=&page=0&facets=%5B%22top_company%22%2C%22isHiring%22%2C%22nonprofit%22%2C%22batch%22%2C%22industries%22%2C%22subindustry%22%2C%22status%22%2C%22regions%22%5D&tagFilters=&facetFilters=%5B%5B%22batch%3A#{batch}%22%5D%5D"
                                   }
                                 ]
                               })

  response = https.request(request)
  File.write("./responses/#{batch}.json", response.read_body)
  puts "#{batch} data found"
end

puts 'All data downloaded'
