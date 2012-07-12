module ApplicationHelper
  def title(*parts)
    @title = ("CodeMap".to_a << parts).join(" | ") unless parts.empty?
    @title || "CodeMap"
  end
end
