# wik-asterisk-fpw

wikipedia-fpw を使用した Wik\*（現状 Wiktionary（日本語） のみ）の EPWING 辞書変換の Docker 環境です。

wikipedia-fpw が GPL なのでライセンスを引き継いでいますが、問題があれば削除等します。

## wikipedia-fpw

変換スクリプトは kazuhiro さんが作成された wikipedia-fpw を私が改造したものです。

[Kazuhiro's blog - wikipedia-fpw](http://ikazuhiro.s206.xrea.com/staticpages/index.php/wikipedia-fpw)

このリポリジトリ以前の改造スクリプト（パッチファイル）は下記からダウンロードできます。

[ソフト - Masatoshi Ito's Home Page](https://mito-homepage.web.app/soft)

## 改造内容

主に外字mapの対応（外字自体はクエスチョンマーク表示）や各種Wiktionary用テンプレートの対応です。

また、ふりがな登録処理をWiktionary用に追加修正しています。

SQLite3を利用して、文字コード順に辞書登録するようにしました。
Wiktionaryだからこそできることで、Wikipediaでは項目が多すぎて同じ方法ではできないかもしれません。

## 実行方法

以前の方法から Makefile に移行しました。
以前の方法も残してあります。

- イメージのビルド（基本１回行えばOK）

  ```shell
  docker-compose build
  ```

- Wiktionary 用 wikipedia-fpw 環境のコンテナ起動

  ```shell
  docker-compose run --rm wiktionary
  ```

- Wiktionary の xml ダウンロード＆変換実行

  `/mnt/work/` にて

  ```shell
  make
  ```

  WIKTION/ として EPWING 辞書作成します。
  wikipedia.xml もダウンロードしますが、ダウンロード済みなら変換のみ実行します。

- fpwmake clean の実行

  `/mnt/work/` にて

  ```shell
  make clean
  ```

  wikipedia.xml は削除しません。
  再度ダウンロードする時は直接 wikipedia-fpw/ にある wikipedia.xml を削除してください。


- Wiktionary の強制 xml ダウンロード

  `/mnt/work/` にて

  ```shell
  make download
  ```

- fpwmake archive の実行

  `/mnt/work/` にて

  ```shell
  make archive
  ```

## 以前の実行方法

- Wiktionary の xml ダウンロード＆変換実行

  ```shell
  bash ./run.sh
  ```

  WIKTION/ として EPWING 辞書作成します。
  wikipedia.xml もダウンロードしますが、ダウンロード済みなら変換のみ実行します。

- fpwmake clean の実行

  ```shell
  bash ./run.sh clean
  ```

  wikipedia.xml は削除しません。
  再度ダウンロードする時は直接 wikipedia-fpw/ にある wikipedia.xml を削除してください。

- fpwmake archive の実行
  ```shell
  bash ./run.sh archive
  ```
