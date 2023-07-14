# python-project-rllab

## UPDATE [11 July, 2023] : 
dockerイメージのビルドにscikit-learnのモジュールインストールを追加


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

### その他
- Dockerコンテナを立ち上げたターミナルは閉じることができる。閉じてもコンテナは停止しない。
- Dockerコンテナを停止したい場合には、サーバで以下のコマンドを打ち込む。
```shell
$ docker container stop assignment3
```
- コンテナを止めるとJupyterの初期設定(パスワード設定など)も消えてしまうので、基本的に止めない。

### Note :
  - The environment runs on GPU so you must install NVIDIA Container Toolkit.
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html


## 課題について
当グループでは~~課題1~~と課題3を選択した．  
追記（7/14）：課題1を課題2に変更．  
### リポジトリの作成  
- 荒木:  
~~課題1~~課題2 https://github.com/Araki-SH/python-project-rllab-kadai1/tree/main
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
- エンコーダ（Encoder）:  
入力データを潜在空間に変換する役割を持つモジュール．一般的に，畳み込み層（Convolutional Layer）や全結合層（Fully Connected Layer）を使用して，データの特徴を抽出し，低次元の表現に変換する．

- デコーダ（Decoder）:  
エンコーダの出力を元の入力データの再構築に使用．エンコーダの逆操作を行うために，逆畳み込み層（Transposed Convolutional Layer）や逆全結合層（Transpose of Fully Connected Layer）を使用．

- 損失関数（Loss Function）:  
オートエンコーダの学習には，入力データと再構築データの間の誤差を定量化する損失関数が必要．一般的な選択肢は平均二乗誤差（Mean Squared Error）や二値交差エントロピー（Binary Cross-Entropy）．

- 最適化アルゴリズム（Optimization Algorithm）:  
オートエンコーダの学習には，パラメータの最適化を行うための最適化アルゴリズムが必要．一般的な選択肢は，確率的勾配降下法（Stochastic Gradient Descent）やその派生アルゴリズムであるAdamやRMSprop等．

### タスクの割り振り
負荷が均等になるように次のようにタスクを割り振る  
- 荒木:  
  aeクラスの実装  

- 本間:  
  vaeクラスの実装
  訓練部分の実装  
  考察
  
## Results
AEとVAEの結果はipynb形式でそれぞれ`vae_notebook/ae.ipynb`と`vae_notebook/vae.ipynb`に記載している．  
また，それぞれを比較し，考察した結果を`vae_notebook/consideration.ipynb`に記載している．

## Dependencies
Dockerコンテナにすべて入っているが一応記載する．
Trained and Tested on:
```
Python 3
PyTorch
NumPy
scikit-learn
```
Training Environments 
```
Python 3
PyTorch
NumPy
scikit-learn
```
Graphs and gifs
```
matplotlib
```


## References
主にネットワーク構造や理論について参考にした．
- Variational AutoEncoder( VAE )
  https://blog.octopt.com/variational-autoencoder/
- 【徹底解説】VAEをはじめからていねいに
  https://academ-aid.com/ml/vae
- Variational Autoencoder徹底解説
  https://qiita.com/kenmatsu4/items/b029d697e9995d93aa24

