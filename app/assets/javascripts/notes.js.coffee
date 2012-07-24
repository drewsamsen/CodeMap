jQuery ->
  $('#note_technology_name').autocomplete
    # source: ['Ruby', 'JavaScript', 'Rails']
    # not working...
    source: $('#note_technology_name').data('autocomplete-source')