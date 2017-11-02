require 'uri'

module HotelSources
  module Models
    class Booking < Source

      def initialize(search)
        super(search)
        @main_url = "booking.com"
        @search_url = ENV['BOOKING_URL']
      end

      def collect_url
        form = scrape_url(@search_url).find_form("#frm")
        form['ss'] = URI.decode @search
        page = form.submit
        links = page.search(".hotel_name_link.url")
        links.first['href']
      end

    end
  end
end
