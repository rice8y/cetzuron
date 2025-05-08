#import "@local/cetzuron:0.1.0": *
#set page(width: auto, height: auto)
#set text(lang: "ja", font: "TeX Gyre Termes", size: 10pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(lang: "ja", font: "Harano Aji Mincho", size: 10pt)

#figure(
  ae(5, 3),
  caption: [With Labels (short)]
)
#figure(
  ae(5, 3, style: "full"),
  caption: [With Labels (full)]
)
#figure(
  ae(4, 2, style: "full", label: false),
  caption: [Without Labels (full)]
)