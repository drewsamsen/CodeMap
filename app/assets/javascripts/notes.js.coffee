jQuery ->
  $('#note_technology_name').autocomplete
    # source: ['foo', 'bar', 'awesome']
    source: $('#technology_source').data('autocomplete_source')