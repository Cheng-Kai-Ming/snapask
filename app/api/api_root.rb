class ApiRoot < Grape::API
  before do
    header "Access-Control-Allow-Origin", "*"
  end
  PREFIX = '/api'.freeze

  format :json

  mount ApiV0::Base
end