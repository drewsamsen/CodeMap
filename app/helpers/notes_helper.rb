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
    # set up my constants
    importance_factor = 0.5
    understanding_factor = 2
    scaler = 12.5

    importance_component = log(importance + importance_factor) * scaler
    understanding_component = log((6 - understanding) + understanding_factor) * scaler
    # result is the two multiplied
    (importance_component * understanding_component).floor
  end

  def log(number)
    Math.log10(number)
  end
end
