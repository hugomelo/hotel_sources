require_relative 'models/tripadvisor'
require_relative 'models/booking'
require_relative 'models/holiday_check'
require_relative 'url_queue'

module HotelSources

  class CLI

    #
    # Collect the urls for the given hotel name from the givens sources
    def self.run(hotel, sources=nil)
      trap("INT") { puts; abort "\033[31mAborting..\033[0m" }

      # load the generic queue to hold the urls
      queue = HotelSources::UrlQueue.new

      sources = %w[Tripadvisor Booking HolidayCheck] if sources.nil?
      threads = []

      sources.each do |source|
        begin
          model = Module.const_get("HotelSources::Models::"+source)
        rescue NameError
          raise "[ERROR] I don't know the source #{source}"
        end

       threads << Thread.new { model.new(hotel).collect_and_enqueue(queue) }
      end

      threads.each {|t| t.join }

      puts queue

    end
  end
end
