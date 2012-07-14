# Custom step to check for content inside of an element with given ID or Class
Then /^I should see "(.*?)" in element "(.*?)"$/ do |text, selector|
  with_scope(selector,:css_id) do
    page.should have_content(text)
  end
end

# below is a custom with_scope class that takes a css type as a second
# parameter. This makes it so that I don't have to add entries in
# features/support/selectors.rb for each match I want to have. It just works
# for checking inside of elements based on an ID or a Class of the element
#
# The source: http://www.cowboycoded.com/2011/01/05/better-web-steps-for-cucumber-with-capybara/

class String
  def csserize
    self.downcase.gsub(" ","-")
  end
end

module WithinHelpers
  def with_scope(locator,css_type=nil)
    locator = convert_locator_to_css(locator,css_type) if locator and css_type
    locator ? within(locator) { yield } : yield
  end

  def convert_locator_to_css(locator,css_type)
    locator = locator.csserize
    return locator if locator =~ /^[.#]/
    css_type==:css_class ? ".#{locator}" : "##{locator}"
  end
end