require_relative 'source'
require          'json'

module HotelSources
  module Models
    class Tripadvisor < Source

      def initialize
        super
        @main_url = "tripadvisor.com"
        @search_url = ENV['TRIPADVISOR_URL'].replace("#QUERY#",search)
      end

      # Collect the internal url of a specific hotel from tripadvisor.com
      #
      # @return [String]
      def collect_url
        page = fetch_url(search_url)
        json = JSON.decode(page.body)
        json.dig("results",0,"urls",0,"url")
      end

    end
  end
end

