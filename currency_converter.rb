require 'uri'
require 'net/http'
require 'nokogiri'

module CurrencyConverter
  def self.convert(from,to)
    Google::convert(from,to)
  end
end
