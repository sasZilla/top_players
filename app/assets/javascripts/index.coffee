###

  Slider for top players
  Oh hover slide on
  On click close btn slide off

###

$document = $(document)

$document.ready ->
  ctrl =
    '$document': $document

    shadowId: '#shadow'
    shadow: null

    containerId: '#top-players-container'
    container: null

    closeBtnId: '#close-btn'

    animationDuration: 600

    isLoading: false
    isLoaded: false

    content: null

    init: ->
      ctrl.container = $(ctrl.containerId)
      $document.on('mouseenter', ctrl.containerId, ctrl.open)
      $document.on('click', ctrl.closeBtnId, ctrl.close)

    open: ->
      unless ctrl.isLoaded
        ctrl.load().then (data)->
          ctrl.container.html(ctrl.content)
          ctrl.animate()
      else
        ctrl.animate()

    close: ->
      ctrl.container.removeClass('open')
      ctrl._customAnimation(0)
      setTimeout(->
        ctrl.shadow.removeClass('on')
      , ctrl.animationDuration)

    load: ->
      ctrl.isLoading = true
      $.get '/top_players/index', (data)->
        ctrl.isLoading = false
        ctrl.isLoaded = true
        ctrl.content = data

    animate: ->
      ctrl.container.addClass('open', ctrl.animationDuration, "easeInQuad")
      ctrl._customAnimation(620)
      ctrl._addShadow()

    _customAnimation: (width)->
      ctrl.container.animate({'max-width': "#{width}px"}, ctrl.animationDuration)

    _addShadow: ->
      ctrl.shadow ||= $(ctrl.shadowId)
      ctrl.shadow.addClass('on')

  ctrl.init()
