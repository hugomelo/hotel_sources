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
      @queue.each do |item|
        puts "#{item['url']} for #{item['name']}
      end
    end
  end
end
