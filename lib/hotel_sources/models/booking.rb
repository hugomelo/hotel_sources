require_relative 'source'

module HotelSources
  module Models
    class Booking < Source

      def initialize
        super
        @main_url = "booking.com"
      end

    end
  end
end
