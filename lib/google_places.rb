require 'rubygems'
require 'erb'
require 'httparty'

%w(client location rectangle prediction request spot error photo).each do |file|
  require File.join(File.dirname(__FILE__), 'google_places', file)
end

module GooglePlaces
  class << self

    attr_accessor :api_key
    attr_writer :after_request_callack

    def configuration
      yield self
    end

    def after_request_callack
      @after_request_callack || proc { |attrs| attrs }
    end

  end
end
