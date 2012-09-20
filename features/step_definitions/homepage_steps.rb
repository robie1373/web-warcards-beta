
Given /^I am on the homepage$/ do
  browser.goto "localhost:4567"
end


#Then /^I should have a list of games to play$/ do
#  doc = Nokogiri::HTML browser.html
#  gamelist = doc.css('ul li a')
#  gamelist.text.should include("Warcards")
#end

Then /^I should see "(.*?)" in the list of games$/ do |game_name|
  doc = Nokogiri::HTML browser.html
  gamelist = doc.css('ul li a')
  gamelist.text.should include(game_name)
end

When /^I click the link to warcards$/ do
  browser.link(:href => "warcards/setup").click
end

Then /^I am taken to the warcards game$/ do
 URI.parse(browser.url).path.should == "/warcards/setup"
end
