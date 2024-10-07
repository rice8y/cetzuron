#import "@local/cetzuron:0.1.0": *
#set page(width: auto, height: auto)
#set text(lang: "ja", font: "TeX Gyre Termes", size: 10pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(lang: "ja", font: "Harano Aji Mincho", size: 10pt)

#figure(
  fcnn(3, 4, 3),
  caption: [ラベル表示 Ver.]
)
#figure(
  fcnn(5, 4, 3, middleLayers: 1, label: false),
  caption: [ラベル非表示 Ver.]
)