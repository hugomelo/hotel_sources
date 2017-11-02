require          'dotenv'
require          'faraday'
require          "hotel_sources/version"
require_relative 'hotel_sources/scraper'
require_relative "hotel_sources/models/source"
require_relative "hotel_sources/models/tripadvisor"
require_relative "hotel_sources/models/booking"
require_relative "hotel_sources/models/holiday_check"


Dotenv.load! '.env'

module HotelSources
end
