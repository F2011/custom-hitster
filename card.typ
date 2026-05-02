#import "@preview/cades:0.3.1": qr-code

#set page(width: 7cm, height: 7cm, margin: 0pt)
#set text(font: "Avenir")

#let frontpage(song) = {
  set page(background: image("foreground-image.png"))
  align(center + horizon, qr-code(
    str(song.link),
    background: white,
    color: black,
    width: 3.5cm,
  ))
}
#let backpage(song) = {
  set page(background: image("background-image.jpg"))
  grid(
    rows: (1fr, 2fr, 1fr), columns: 100%,
    align(center + horizon, text(weight: "bold")[#song.artist]),

    align(center + horizon, text(size: 40pt, weight: "bold")[#song.year]),

    align(center + horizon, text(weight: "bold")[#song.title]),
  )
}

#let songs = toml("selected.toml").songs
#for song in songs {
  [
    #frontpage(song)
    #pagebreak(weak: true)
    #backpage(song)
    #pagebreak(weak: true)
  ]
}
