require 'sinatra'
require 'json'

set :port, ENV.fetch('PORT', 3008)

CUSTOMERS = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' }
]

get '/customers' do
  content_type :json
  CUSTOMERS.to_json
end

get '/customers/:id' do
  content_type :json
  customer = CUSTOMERS.find { |c| c[:id] == params[:id].to_i }
  halt 404, { error: 'Not found' }.to_json unless customer
  customer.to_json
end

get '/' do
  'CRM service running'
end
