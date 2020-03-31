$(document).ready ->
  $('.religions').on 'click', ->
    console.log 'openable-menu click'
    $('.openable-menu').toggleClass 'close-menu', 3000
