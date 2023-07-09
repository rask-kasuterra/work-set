
# Docker コマンド
- `docker run`：新しいコンテナを作成して実行します。
    - 例：`docker run -it ubuntu bash`
    - -iはコンテナと対話的に操作するためのもので、コンテナの標準入力を開いたままにする。
    - -tはtty（teletypewriter: 端末）を割り当てるためのもの。ユーザーが新しい端末セッションを作成してコンテナと対話することを可能にする。
- `docker ps`：現在稼働しているコンテナの一覧を表示します。
- `docker ps -a`：すべてのコンテナの一覧を表示します（稼働中、停止中含む）。
- `docker images`：ローカルに存在するDockerイメージの一覧を表示します。
- `docker pull`：Dockerイメージをレポジトリから取得します。
    - 例：`docker pull ubuntu`
- `docker build`：Dockerfileを元に新しいDockerイメージをビルドします。
    - 例：`docker build -t my_image .`
- `docker rm`：コンテナを削除します。
    - 例：`docker rm my_container`
- `docker rmi`：イメージを削除します。
    - 例：`docker rmi my_image`
- `docker stop`：稼働しているコンテナを停止します。
    - 例：`docker stop my_container`
- `docker start`：停止しているコンテナを再開します。
    - 例：`docker start my_container`
- `docker exec`：稼働中のコンテナ内でコマンドを実行します。
    - 例：`docker exec -it my_container bash`
- `docker logs`：コンテナのログを表示します。
    - 例：`docker logs my_container`

# docker-compose コマンド

- `docker-compose up -d`:docker-compose.yaml に記述しているすべての docker を起動
  - -dオプションは"detach"の略
  - Dockerはバックグラウンドでコンテナを実行し、コンソールを解放する
- `docker-compose down`:docker-compose.yaml に記述しているすべての docker を停止
