
onEndless = ->
  $(window).off 'scroll', onEndless
  url = $('.pagination .next_page').attr('href')
  $('.pagination').hide()
  if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
    $.getScript url, ->
      $(window).on 'scroll', onEndless
  else
    $(window).on 'scroll', onEndless

$(window).on 'scroll', onEndless
  
$(window).scroll()
