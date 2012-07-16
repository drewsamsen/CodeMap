# This step builds an instance of the Technology class
Given /^the technology "(.*?)" exists$/ do |tech_name|
  @technology = Technology.find_or_create_by_name(tech_name)
  @technology.save
end