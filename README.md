# python-project-rllab

## UPDATE [10 July, 2023] : 
使い方を変更．それに伴い使い方の記載を改めた．


## Introduction
Pythonチュートリアル荒木本間班の課題3のリポジトリ  
This repository is for assignments of M1 tutorial by Robot Learning Lab.   


## Usage
M1tutorialで使用したDockerファイルを用いて環境を構築している。

### コンテナの立ち上げまで
- `python-project-rllab/`をまるごとリモート環境または自分が使用する環境の任意のディレクトリに配置する。
- `./python-project-rllab/docker`に移動して以下のコマンドを打ち込む。ここで、"password"はdocker環境内のユーザのパスワードであり、個々人が個別のものを設定する。
  - 注意点: dockerコマンドを管理者権限なしで実行できると仮定
````shell
$ bash build_docker.sh password
````
- Dockerイメージの構築が終わったら、以下のコマンドを打ち込んでJupyter Labを立ち上げる。
````shell
$ bash run_docker.sh
````
- 画面上に英数字の羅列が表示されるだけだが、起動している。

### Jupyterの初期セットアップ
- まず、以下のコマンドを入力してJupyterLabのtokenを確認する。
```shell
$ docker logs assignment3
```
- 以下に出力例を示す。
  - 末尾から二行目に記載されているURLの`token=`以降がトークンである。これをコピーしておく。
```text
....(省略)....

[I 2023-06-20 16:24:13.211 ServerApp] http://localhost:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.211 ServerApp]     http://127.0.0.1:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.211 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2023-06-20 16:24:13.213 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///home/y-kwon/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://localhost:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
        http://127.0.0.1:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.224 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server

```
- 次に、Webブラウザ経由でJupyterLabにアクセスする。デフォルトでは`63323`番のポートを使用している。
  - つまり、サーバ側のIPが`163.221.8.11`だとするとブラウザのアドレスバーに`163.221.8.11：63323`と打ち込む。
- 打ち込むとJupyterのログイン画面が表示されるので、下部の**Setup a Password**にあるTokenに先ほどコピーしたトークンを貼り付ける。
- そして、New Passwordに自分のパスワード (冒頭のパスワードとは別で良い)を設定する。次回以降はこのパスワードでログインできる。
- 全て入力できたら、`Log in and set new password`をクリックする。
- 以上でJupyterLabの初期セットアップが完了した。

## その他
- Dockerコンテナを立ち上げたターミナルは閉じることができる。閉じてもコンテナは停止しない。
- Dockerコンテナを停止したい場合には、サーバで以下のコマンドを打ち込む。
```shell
$ docker container stop assignment3
```
- コンテナを止めるとJupyterの初期設定(パスワード設定など)も消えてしまうので、基本的に止めない。


#### Note :
  - The environment runs on GPU so you must install NVIDIA Container Toolkit.
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html


## 課題について
当グループでは課題1と課題3を選択した．
### リポジトリの作成  
- 荒木:  
課題1 https://github.com/Araki-SH/python-project-rllab-kadai1/tree/main
- 本間:  
課題3  （このリポジトリ）

~~基本的にそれぞれが割り振られたものをすべて担当するが，班内でわからないところがあれば助け合う．~~

### 想定される機能
#### ハイパラ  
- エンコーダとデコーダの層の数とサイズ:  
エンコーダとデコーダの層の数や各層のユニット数．層の数が多いほどより高度な特徴を捉えることができるがモデルのパラメータ数が増えるため過学習のリスクも高まる．

- 活性化関数:  
エンコーダとデコーダの各層で使用する活性化関数．一般的にはReLUやシグモイド関数などが使用されるが，特定のデータセットやタスクによって最適な活性化関数は異なる場合がある．

- 損失関数:  
オートエンコーダの学習では再構成誤差を最小化するために適切な損失関数を選ぶ必要がある．一般的には平均二乗誤差（MSE）やバイナリクロスエントロピー等が用いられる．

- 学習率と最適化アルゴリズム:  
学習率は，オプティマイザがパラメータを更新する際のステップの大きさを制御する．通常はグリッドサーチやハイパーパラメータの最適化手法を使用して最適なものを確実に用いることが望ましい．また，最適化アルゴリズムとしては，勾配降下法（SGD），Adam，そしてRMSprop等が一般的に用いられる．

- バッチサイズとエポック数:  
バッチサイズはトレーニング中に一度に処理するサンプルの数を指定する．適切なバッチサイズを選ぶことでメモリ使用量とトレーニングの効率性のバランスを調整することができる．また，エポック数はデータセット全体をトレーニングする際の反復回数を指定する．

#### モジュール


### タスクの割り振り
負荷が均等になるように次のようにタスクを割り振る  
- 荒木:  

- 本間:  


## Results
課題で得られた結果があれば載せる


## Dependencies
Dockerコンテナにすべて入っているが一応記載する．
Trained and Tested on:
```
Python 3
PyTorch
NumPy
```
Training Environments 
```
Python 3
PyTorch
NumPy
```
Graphs and gifs
```
pandas
matplotlib
Pillow
```


## References

## ディレクトリ構成
```text
.
├── README.md               
├── docker/                     : Dockerセットアップ用
│   ├── Dockerfile
│   ├── build_docker.sh             : イメージビルド
│   └── run_docker.sh               : コンテナ立ち上げ
├── mlp_notebook/           : 課題1
└── jupyter_lab_config.py       : JupyterLabの設定ファイル

```
