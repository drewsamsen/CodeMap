module ApplicationHelper
  def trim(string, length)
    truncate(string, :length => length, :omission => '... ', :separator => ' ')
  end

  def set_title(title)    
    @title =  trim(title, 40) + "| CodeMap" unless title.empty?
    content_for :title do @title || "CodeMap" end
  end
end
