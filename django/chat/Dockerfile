# Python3.10のベースイメージを使用
FROM python:3.10

# バッファリングの無効化
ENV PYTHONUNBUFFERED 1

# バイトコードにコンパイルして .pyc ファイルを作成することを無効
# TODO 本番では消してもいいかも？
ENV PYTHONDONTWRITEBYTECODE 1

# 必要なツール群をインストール
RUN apt update && apt install -y \
    vim \
    iproute2 \
    less \
    redis-server \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# JavaScript ライブラリのインストール
RUN npm install -g firebase firebase-tools

# ll コマンドの alias 追加
RUN /bin/bash -c "echo -e \"\n\
    alias ll='ls -la --color'\n\
    \" >> /root/.bashrc"

# 作業ディレクトリを設定
WORKDIR /app

# 必要なPythonパッケージをインストール
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# src ディレクトリ配下のファイルを作業ディレクトリにコピー
#COPY ./test_chat/ .
COPY . /app/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
