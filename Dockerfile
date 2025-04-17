# ベースイメージは公式のWordPress
FROM wordpress:latest

# ポート80を公開（Renderが自動で使ってくれる）
EXPOSE 80