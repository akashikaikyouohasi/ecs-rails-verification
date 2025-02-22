# デフォルトのターゲット
.PHONY: up down build start stop restart logs

# コンテナをビルドして起動
up:
	docker-compose up -d

# コンテナを停止して削除
down:
	docker-compose down

# イメージも含めて削除
down-all:
	docker-compose down --rmi all

# コンテナをビルド
build:
	docker-compose build

# コンテナを起動
start:
	docker-compose start

# コンテナを停止
stop:
	docker-compose stop

# コンテナを再起動
restart:
	docker-compose restart

# コンテナのログを表示
logs:
	docker-compose logs -f

# 特定のサービスのログを表示
logs-%:
	docker-compose logs -f $*

# コンテナのステータスを表示
ps:
	docker-compose ps
