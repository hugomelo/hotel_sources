require 'mechanize'

module HotelSources

  class Scraper

    def initialize url
      doc = Mechanize.new
      @page = doc.get(url)
    end

    def find_form(selector)
      method = selector.start_with?("#") ? "dom_id" : "dom_clas"
      @page.forms.select{|f| f.send(method) == selector[1..-1] }.first
    end

  end
end
