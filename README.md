# ニューラルネットワーク描画パッケージ (CeTZ)

## Install

`git clone` する.

```bash
$ git colne https://github.com/rice8y/cetzuron.git
```

ローカルにパッケージをインストールする.

```bash
$ chmod +x init.sh
$ ./init.sh
```

WSL2 での実行例.

```bash
$ ./init.sh
Package cetzuron version 0.1.0 has been installed to /home/rice8/.local/share/typst/packages/local/cetzuron/0.1.0
```

## Usage

### 1. 全結合型ニューラルネットワーク `#fcnn`

```typ
#import "@local/cetzuron:0.1.0": *
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
```

![sample](./docs/fcnn/sample_fcnn.png)