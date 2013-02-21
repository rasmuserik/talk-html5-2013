scale = ($elem, s) ->
  for prefix in ["", "-moz-", "-webkit-", "-o-", "-ms-"]
    $elem.css prefix + "transform-origin", "0 0"
    $elem.css prefix + "transform", "scale(#{s},#{s})"

if Meteor.isClient
  Meteor.startup ->
    for section in $ "section"
      children = $(section).children "section"
      count = children.length
      childscale = (18 - (count - 1)) / 18 / count
      height = 18*childscale + 1
      for child, i in children
        $(child).css {
          top: i*height + "em",
          left: "19em" }
        scale($(child), childscale)
    for h1 in $ "h1"
      size = 1;
      $h1 = $ h1
      lineWidth = $h1.width()
      $h1.css {
        "display": "inline",
        "white-space": "pre",
        "font-size": size}
      while $h1.width() < lineWidth and $h1.height() < lineWidth / 6
        ++size
        $h1.css "font-size", size
      --size
      $h1.css "font-size", size
      $h1.css "display", "block"

