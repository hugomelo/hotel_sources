module HotelSources
  class UrlQueue
    def initialize
      @queue = []
    end

    def next_url
      @queue.shift
    end

    def add_url url
      @queue << url
    end

    def to_s
      @queue.collect do |item|
        "#{item[:url]} for #{item[:name]}"
      end.join("\n")
    end
  end
end
