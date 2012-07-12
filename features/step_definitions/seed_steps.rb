Given /^there is a note called "(.*?)"$/ do |subject|
  Factory(:note, :subject => subject)
end