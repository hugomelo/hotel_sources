# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hotel_sources/version"

Gem::Specification.new do |spec|
  spec.name          = "hotel_sources"
  spec.version       = HotelSources::VERSION
  spec.authors       = ["Hugo Melo"]
  spec.email         = ["hugo@riseup.net"]

  spec.summary       = %q{A gem to search hotel review urls from different review systems.}
  spec.description   = %q{Get the URL a hotel on Tripadvisor, Booking.com and HolidayCheck.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.4.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"

  spec.add_dependency             "dotenv"
  spec.add_dependency             "faraday"
  spec.add_dependency             "mechanize"
end
