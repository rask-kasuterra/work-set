1. docker コマンドのインストール
   - `sudo apt update`
   - `sudo apt install docker.io`
2. docker グループに所属させることで sudo なしで docker コマンドを使えるようにする
   - `sudo usermod -aG docker ${USER}`
   - `sudo reboot`
3. 新しく作成したい Django 用のディレクトリと必要なファイルを用意
    - `bash make_app.sh ${app_name}` コマンドを実行すると mkdir と Dockerfile 等の必要なファイルをコピー
4. .make_env の変更
    - Django のプロジェクト名、アプリ名と作成する Docker のイメージ名、コンテナ名を指定
    - 開発用 Docker は `-dev` がイメージ名、コンテナ名の後ろにつく
5. requirementstxt の変更
    pip install が必要なファイルが有れば追記
6. `make build` で開発用の docker container を作成
7. `make areate-app` で Django のプロジェクトやファイルを作成
8. 