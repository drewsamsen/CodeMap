Given /^there is a note called "(.*?)"$/ do |subject|
  Factory(:note, :subject => subject)
end

Given /^there is a technology called "(.*?)"$/ do |technology_name|
  Factory(:technology, :name => technology_name)
end