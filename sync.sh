#!/bin/bash
# סנכרון אוטומטי עם GitHub

FOLDER="/Users/guygoldman/Desktop/Boldevo"
cd "$FOLDER"

echo "🔄 מושך שינויים מליאור..."
git pull origin main --no-rebase 2>/dev/null

echo "👁 מאזין לשינויים... (Ctrl+C לעצור)"
fswatch -o "$FOLDER" --exclude=".git" | while read f; do
  cd "$FOLDER"
  git add .
  git diff --cached --quiet || git commit -m "עדכון אוטומטי $(date '+%d/%m %H:%M')" && git push origin main && git push lior main
done
