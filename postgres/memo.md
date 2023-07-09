# やりたいこと
- [] 好きに使える postgresql サーバをすぐ起動できる docker 作成
  - [] schema.sql を読み込んでテーブル作成できるようにする
    - [] 必要なスキーマの洗い出し
  - [] data.sql を読み込んでデータを挿入できるようにする
    - [] 必要なデータの洗い出し
  - [] psql -Upostgres -hlocalhost -p${post} で接続できるようにする
  - [] どの docker の postgres につなぐかはポートで区別する
- [] DB スペシャリストの午後問を実践するための DB, テーブル作成
- [] 可能であれば、他の docker 内部から接続できるようにする
  - -hlocalhost を変えないとだめ？

# memo
## docker 起動コマンド
## docker run -d --name sample-db -p 65432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=passwd -e POSTGRES_DB=sample-db postgres:14

## image の build
## docker build -t postgres14 .

## docker-compose コマンドでの postgresql の起動
docker-compose up -d

