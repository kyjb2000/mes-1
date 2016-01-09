window.notify = (options) ->
  $.growl {title: options.title, message: options.message, url: options.url},
    element: 'body'
    type: options.type || "info"
    offset:
      x: 20
      y: 85
    allow_dismiss: true
    spacing: 10
    z_index: 1031
    delay: 2500
    timer: 1000
    url_target: '_blank'
    mouse_over: false
    animate:
      enter: "animated fadeInRight"
      exit: "animated fadeOutLeft"
    icon_type: 'class'
    template: '<div data-growl="container" class="alert" role="alert">' + '<button type="button" class="close" data-growl="dismiss">' + '<span aria-hidden="true">&times;</span>' + '<span class="sr-only">Close</span>' + '</button>' + '<span data-growl="icon"></span>' + '<span data-growl="title"></span>' + '<span data-growl="message"></span>' + '<a href="#" data-growl="url"></a>' + '</div>'
  return
