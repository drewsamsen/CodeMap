module NotesHelper
  def markdown(text)
    # set up our Redcarpet options. Details can be found at
    # http://rdoc.info/github/tanoku/redcarpet/
    options = {
      :hard_wrap => true,
      :filter_html => true
      }

    # construct the renderer
    renderer = Redcarpet::Render::HTML.new(options)

    # set up more Redcarpet options
    extensions = {
      :autolink => true,
      :space_after_headers => true,
      :no_intra_emphasis => true,
      :fenced_code_blocks => true,
      :autolink => true
    }
    
    # build it
    markdown = Redcarpet::Markdown.new(renderer, extensions).render(text)
    # run it through the syntax_highligher, using CodeRay     
    syntax_highlighter(markdown).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    # finds the language of the code,
    # runs the code through CodeRay using that language,
    # and makes the replacement. Found out about .get_attribute("class")
    # from http://nokogiri.org/Nokogiri/XML/Node.html#method-i-css
    doc.css('code').select.each do |pre|      
      language = pre.get_attribute("class")      
      highlighed_code = CodeRay.scan(pre.text, language).div(:line_numbers => :table)
      pre.replace highlighed_code
    end
    doc.to_s
  end

  def urgency(importance, understanding)
    # set up my parameters
    log_multiplier = 3
    log_base = 3
    scaler = 2.5
    smoother = 8

    log_piece = Log(4)
  end

end
