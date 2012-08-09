module ApplicationHelper
  def trim(string, length)
    truncate(string, :length => length, :omission => '... ', :separator => ' ')
  end

  def set_title(title)    
    @title =  trim(title, 40) + "| CodeMap" unless title.empty?
    content_for :title do @title || "CodeMap" end
  end

  def sortable(column, title = nil)
  	title ||= column.titleize
  	direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
  	link_to title, {:sort => column, :direction => direction},
  				   {:title => "Sort by #{title}"}
  end
end
