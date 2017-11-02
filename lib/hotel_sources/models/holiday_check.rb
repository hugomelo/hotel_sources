module HotelSources
  module Models
    class HolidayCheck < Source

      def initialize(search)
        super(search)
        @main_url = "holidaycheck.de"
        @search_url = ENV['HOLIDAY_CHECK_URL'].sub('#QUERY#',@search)
        @second_url = ENV['HOLIDAY_CHECK_2ND_URL']
      end

      def collect_url
        page = fetch_url
        json = JSON.parse(page.body)
        id = json.first["id"]
        page = fetch_url(@second_url + id)
        page.env.url.to_s
      end

    end
  end
end
