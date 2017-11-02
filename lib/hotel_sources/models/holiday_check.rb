require_relative 'source'

module HotelSources
  module Models
    class HolidayCheck < Source

      def initialize
        super
        @main_url = "holidaycheck.de"
      end

    end
  end
end
