require 'json'

module HotelSources
  module Models
    class Tripadvisor < Source

      def initialize(search)
        super(search)
        @main_url = "tripadvisor.com"
        @search_url = ENV['TRIPADVISOR_URL'].sub("#QUERY#",search)
      end

      # Collect the internal url of a specific hotel from tripadvisor.com
      #
      # @return [String]
      def collect_url
        page = fetch_url
        json = JSON.parse(page.body)
        json.dig("results",0,"urls",0,"url")
      end

    end
  end
end

