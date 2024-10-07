#import "@local/cetzuron:0.1.0": *
#set page(width: auto, height: auto)
#set text(lang: "ja", font: "TeX Gyre Termes", size: 10pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(lang: "ja", font: "Harano Aji Mincho", size: 10pt)

#figure(
  ae(5, 3),
  caption: [ラベル表示 Ver. (short)]
)
#figure(
  ae(5, 3, style: "full"),
  caption: [ラベル表示 Ver. (full)]
)
#figure(
  ae(4, 2, style: "full", label: false),
  caption: [ラベル非表示 Ver. (full)]
)