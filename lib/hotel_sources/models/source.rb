require 'uri'
require 'faraday'

module HotelSources
  module Models
    class Source

      # @param [String]
      def initialize(search)
        # encode the url to be used later
        @search = URI.encode(search)
      end

      # @return [String]
      def search
        @search
      end

      #
      # Fetch the url using Faraday
      # @param [String] url
      # @return [String
      def fetch_url url
        begin
          Faraday.get(url).try(:body)
        rescue Faraday::ConnectionFailed
          puts "[ERROR] Had a connection error for #{@main_url}. Please, try again later."
          ""
        end
      end

      #
      # @param [HotelSources::Queue] queue
      def collect_and_enqueue(queue)
        queue.add_url({name: @main_url, url: collect_url})
      end

      # @return [String] search_url
      def search_url
        @search_url || ""
      end
    end
  end
end
