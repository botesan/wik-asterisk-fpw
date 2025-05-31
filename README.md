# wik-asterisk-fpw

wikipedia-fpw を使用した Wik*（現状 Wiktionary のみ）の EPWING 辞書変換の Docker 環境です。

wikipedia-fpw が GPL なのでライセンスを引き継いでいますが、問題があれば削除等します。

## wikipedia-fpw

変換スクリプトは kazuhiro さんが作成された wikipedia-fpw を私が改造したものです。
そこから見直しを行っています。

[Kazuhiro's blog - wikipedia-fpw](http://ikazuhiro.s206.xrea.com/staticpages/index.php/wikipedia-fpw)

以前の改造スクリプトは下記からダウンロードできます。

[ソフト - Masatoshi Ito's Home Page](https://mito-homepage.web.app/soft)

## 実行方法

* Wiktionary 用 wikipedia-fpw 環境のコンテナ起動
    ```shell
    docker-compose run --rm wiktionary
    ```

* Wiktionary の xml ダウンロード＆変換実行
    ```shell
    ./run.sh
    ```
    WIKTION/ として EPWING 辞書作成します。
    wikipedia.xml もダウンロードしますが、ダウンロード済みなら変換のみ実行します。

* fpwmake clean の実行
    ```shell
    ./run.sh clean
    ```
    wikipedia.xml は削除しません。
    再度ダウンロードする時は直接 wikipedia-fpw/ にある wikipedia.xml を削除してください。

* fpwmake archive の実行
    ```shell
    ./run.sh archive
    ```
