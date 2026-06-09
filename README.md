# リポジトリテンプレート

## セットアップ

### 前提条件

- [uv](https://docs.astral.sh/uv/) がインストール済みであること

### uv　プロジェクトの作成

```bash
bash python-project-starter.sh
```

を実行すると以下が自動で実行される。
1. uv initの実行
2. ライブラリのインストール
3. SKILLsのダウンロード


## 主要コマンド

```bash
uv sync                   # 依存関係のインストール・同期
```

```bash
uv run pytest             # テスト実行
uv run ruff check --fix . # リント
uv run black .            # フォーマット
uv run mypy .             # 型チェック
```

## ディレクトリ構成

```
.
├── data/      # データセット
├── notebooks/ # 分析用Notebook
├── outputs/   # 結果などの成果物                         
└── src//      # テスト
```


## パッケージ管理

- **uv のみを使用**する。pip、conda、poetry は使わない。
- 依存関係の追加: `uv add <package>`
- 開発依存の追加: `uv add --group dev <package>`


# 参考

- [ds-ai-coding-skills](https://github.com/atsushi-green/ds-ai-coding-skills)