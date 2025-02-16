
## やりたいこと
- tfactionの導入と動作確認
- renovateの設定と動作確認
- ECSのTerraform作成
- Railsアプリケーションのデプロイ
- 静的ファイルのデプロイと確認
- 複数環境へのデプロイ
- 非同期処理の動作確認
- Serverlessの検証
    - AuroraとElastiCache
- CloudFrontの設定検証
- 負荷試験してみる
- 静的解析自動実行
- ユニットテスト自動実行
- CI/CDの計測実装
- Datadogの導入
- ログ出力設定

## 環境情報
- 検証環境
    - 動作確認など
- PR環境
    - PRでの動作確認用環境
    - 検証環境と相乗り
- 本番環境
    - 本番環境

## デプロイフロー
1. featureブランチで開発
1. PR作成後、指定コマンド実行でPR環境作成可能。
1. レビュー
1. mainブランチへマージで、検証環境にデプロイ
1. releaseブランチへのマージで、本番環境にデプロイ

## GitHubの設定
### 有効にする設定
- mainとrelaaseブランチは、マージ前にレビューを必須にする
- CIをパスすることを必須にする。今回ならfmtやvalidate、planが該当
- ブランチの自動削除(Automatically delete head branches Loading)

## terraform
### CI/CD
[tfaction](https://suzuki-shunsuke.github.io/tfaction/docs/)を導入しています

[セットアップはこちら参照](https://suzuki-shunsuke.github.io/tfaction/docs/config/setup)。

[サンプルはこちら](https://github.com/suzuki-shunsuke/tfaction-example)。
tfactionを利用したworkflowsもこちら参照。

サンプルを利用する場合は、GitHub Appの追加が必要。[権限はこちら参照](https://suzuki-shunsuke.github.io/tfaction/docs/config/github-token)。

リポジトリのsecretsに、`APP_ID`と`APP_PRIVATE_KEY`を登録してください！

- `APP_ID`：作成したGitHub AppのID
- `APP_PRIVATE_KEY`：GitHub AppでPrivate keysを作成してpemファイルの内容を設定


## メモ
- aquaのChecksum作成
    - `aqua update-checksum`(upc   Create or Update aqua-checksums.json) を実行する