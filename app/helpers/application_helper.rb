module ApplicationHelper

  # used to trim the length of the subject on the home page
  def trim(string, length)
    truncate(string, :length => length, :omission => '... ', :separator => ' ')
  end

  def set_title(title)    
    @title =  trim(title, 40) + "| CodeMap" unless title.empty?
    content_for :title do @title || "CodeMap" end
  end

  # used in the view to create a link_to which sends the correct params to do a 
  # sorted table, like on the note's index page
  def sortable(column, title = nil)
  	title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
  	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  	link_to title, {:sort => column, :direction => direction},
  				   {:title => "Sort by #{title}", :class => css_class}
  end
end
