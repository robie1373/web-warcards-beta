require 'watir-webdriver'
require 'nokogiri'
require './app'
require 'open-uri'


module HasBrowser
  @@browser = Watir::Browser.new :chrome
  at_exit { @@browser.close }

  def browser
    @@browser
  end
end

World HasBrowser