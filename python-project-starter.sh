#!/bin/bash

# このスクリプトを実行することで、uvを活用して、
# 新規ディレクトリまたは現在のディレクトリでプロジェクトの準備が自動実行される。

# -------------------------------------------
# uv initの実行
# -------------------------------------------
uv init
if [ -f "./requirements.txt" ]; then
  uv add -r requirements.txt
  echo "requirements.txtの内容をuvに追加しました。"
else
  echo "requirements.txt が見つからなかったため、依存関係の追加をスキップしました。"
fi

if [ -f "./requirements-dev.txt" ]; then
  
  uv add --dev -r requirements-dev.txt
  echo "requirements-dev.txtの内容をuvのdevグループに追加しました。"
  
  if [ -f "./.pre-commit-config.yaml" ]; then
    echo ".pre-commit-config.yamlが見つかりました。pre-commitのインストールを実行します。"
    uv run pre-commit install
  fi

else
  echo "requirements-dev.txt が見つからなかったため、dev依存関係の追加をスキップしました。"
fi


# -------------------------------------------
# SKILLsのdownload
# -------------------------------------------
echo "SKILLsをdownloadしますか？ (y/n)"
read -r -p "選択: " DOWNLOAD_SKILLS

if [ "$DOWNLOAD_SKILLS" = "y" ]; then
  # gitの指定したリポジトリをURLから自動でdownload
  git clone <リポジトリのURL>
fi


# -------------------------------------------
# プロジェクトの準備完了
# -------------------------------------------
echo "プロジェクト '$PROJECT_NAME' の準備ができました。"