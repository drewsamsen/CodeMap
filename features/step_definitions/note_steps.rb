# This step builds an instance of the Note class given a table of attributes
Given /^there are the following notes:$/ do |table|
  table.hashes.each do |attributes|
    @note = Note.create!(attributes)
  end
end

# This step creates an association between Note and Technology. Booyah!
Given /^the note "(.*?)" has the technology "(.*?)"$/ do |note, technology|
  @note = Note.find_by_subject!(note)
  @note.technologies << Technology.find_or_create_by_name(technology)
end