# ニューラルネットワーク描画パッケージ (CeTZuron)

## Installation

### 1. `git clone` する

```bash
$ git clone https://github.com/rice8y/cetzuron.git
$ cd cetzuron
```

### 2. `justfile` か `.sh`, `.bat` でローカルにパッケージをインストールする

#### 2-1. `justfile` の場合

```bash
$ just install
```

<details>
<summary>WSL2 (Ubuntu) での実行例</summary>

```bash
$ just install
Package cetzuron version 0.1.0 has been installed to /home/rice8/.local/share/typst/packages/local/cetzuron/0.1.0
```

</details>

#### 2-2. `.sh` の場合

```bash
$ chmod +x install.sh
$ ./install.sh
```

<details>
<summary>WSL2 (Ubuntu) での実行例</summary>

```bash
$ ./install.sh
Package cetzuron version 0.1.0 has been installed to /home/rice8/.local/share/typst/packages/local/cetzuron/0.1.0
```

</details>

#### 2-3. `.bat` の場合

```cmd
> install.bat
```

<details>
<summary>Windows (cmd) での実行例</summary>

```bash
> install.bat
C:install.sh
C:justfile
C:README.md
C:typst.toml
C:docs\ae\sample_ae.pdf
C:docs\ae\sample_ae.png
C:docs\ae\sample_ae.typ
C:docs\fcnn\sample_fcnn.pdf
C:docs\fcnn\sample_fcnn.png
C:docs\fcnn\sample_fcnn.typ
C:docs\lstm\sample_lstm.pdf
C:docs\lstm\sample_lstm.png
C:docs\lstm\sample_lstm.typ
C:docs\rnn\sample_rnn.pdf
C:docs\rnn\sample_rnn.png
C:docs\rnn\sample_rnn.typ
C:src\ae.typ
C:src\fcnn.typ
C:src\lib.typ
C:src\lstm.typ
C:src\requirements.typ
C:src\rnn.typ
23 File(s) copied
Package cetzuron version 0.1.0 has been installed to C:\Users\yoneyama\AppData\Roaming\typst\packages\local\cetzuron\0.1.0 

```

</details>

## Usage

`#import` でパッケージを読み込む.

```typ
#import "@local/cetzuron:0.1.0"
```

### 1. 全結合型ニューラルネットワーク `#fcnn`

#### Parameters

```typ
fcnn(
    inputNodes: int, 
    middleNodes: int, 
    outputNodes: int, 
    middleLayers: int,
    label: bool,
) -> content
```

**inputNodes:** 入力層のノード数  
**middleNodes:** 隠れ層のノード数  
**outputNodes:** 出力層のノード数  
**middleLayers:** 隠れ層の層数 (default: 3)  
**label:** ラベルの有無 (default: true)

#### `#fcnn` の使用例

```typ
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
```

![sample](./docs/fcnn/sample_fcnn.png)

### 2. 再帰型ニューラルネットワーク `#rnn`

#### Parameters

```typ
rnn(
    inputNodes: int, 
    middleNodes: int, 
    outputNodes: int, 
    middleLayers: int,
    label: bool,
) -> content
```

**inputNodes:** 入力層のノード数  
**middleNodes:** 隠れ層のノード数  
**outputNodes:** 出力層のノード数  
**middleLayers:** 隠れ層の層数 (default: 3)  
**label:** ラベルの有無 (default: true)

#### `#rnn` の使用例

```typ
#import "@local/cetzuron:0.1.0": *
#set page(width: auto, height: auto)
#set text(lang: "ja", font: "TeX Gyre Termes", size: 10pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(lang: "ja", font: "Harano Aji Mincho", size: 10pt)

#figure(
  rnn(3, 4, 3),
  caption: [ラベル表示 Ver.]
)
#figure(
  rnn(5, 4, 3, middleLayers: 1, label: false),
  caption: [ラベル非表示 Ver.]
)
```

![sample](./docs/rnn/sample_rnn.png)

### 短・長期記憶 `#lstm`

#### Parameters

```typ
lstm(
    inputNodes: int, 
    middleNodes: int, 
    outputNodes: int, 
    middleLayers: int,
    label: bool,
) -> content
```

**inputNodes:** 入力層のノード数  
**middleNodes:** 隠れ層のノード数  
**outputNodes:** 出力層のノード数  
**middleLayers:** 隠れ層の層数 (default: 3)  
**label:** ラベルの有無 (default: true)

#### `#lstm` の使用例

```typ
#import "@local/cetzuron:0.1.0": *
#set page(width: auto, height: auto)
#set text(lang: "ja", font: "TeX Gyre Termes", size: 10pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(lang: "ja", font: "Harano Aji Mincho", size: 10pt)

#figure(
  lstm(3, 4, 3),
  caption: [ラベル表示 Ver.]
)
#figure(
  lstm(5, 4, 3, middleLayers: 1, label: false),
  caption: [ラベル非表示 Ver.]
)
```

![sample](./docs/lstm/sample_lstm.png)

### オートエンコーダ `#ae`

#### Parameters

```typ
ae(
    inputNodes: int, 
    middleNodes: int, 
    style: string,
    label: bool,
) -> content
```

**inputNodes:** 入力層/出力層のノード数  
**middleNodes:** 隠れ層のノード数  
**style:** 隠れ層の形状 \["short", "full"\] (default: "short")  
**label:** ラベルの有無 (default: true)

#### `#ae` の使用例

```typ
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
```

![sample](./docs/ae/sample_ae.png)
