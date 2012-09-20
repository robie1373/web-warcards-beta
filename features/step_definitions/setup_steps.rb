
Given /^I am on the setup page$/ do
  browser.goto "localhost:4567/warcards/setup"
end

When /^I set my name$/ do
browser.text_field(:name, "player_name").set("Robie")
end

When /^I set the difficulty$/ do
  browser.input(:name, "difficulty").focus
  browser.input(:name, "difficulty").send_keys '7'
end

When /^I select the test questions$/ do
  browser.select_list(:name, "filename").select "Todo add another option"
end

When /^I submit the page$/ do
  browser.button(:id, "set").click
end

Then /^the game should know the difficulty$/ do
  browser.h2(:id, "difficulty").text.should == "Difficulty: 7"
end

Then /^the game should know which questions to use$/ do
  browser.trs.first.text.match /Do you get Tom Servo/
end