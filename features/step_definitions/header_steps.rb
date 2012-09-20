Given /^I am on a web_warcards page$/ do
  browser.goto 'localhost:4567/'
end

When /^I click the about link$/ do
  browser.link(:text => "about").click
end

Then /^I should see the about page$/ do
  doc = Nokogiri::HTML browser.html
    about_text = doc.css('p')
    about_text.text.should match(/This is Cardgames/)
end

Given /^I am on  "(.*?)"$/ do |start_page|
  base = "http://localhost:4567"
  browser.goto base << start_page
end

When /^I click the "(.*?)"$/ do |link_text|
  browser.link(:text => link_text).click
end

Then /^I should be on the "(.*?)"$/ do |url_end|
  URI.parse(browser.url).path.should == url_end
end
