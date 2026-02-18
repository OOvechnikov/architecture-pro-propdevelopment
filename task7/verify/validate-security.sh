#!/bin/bash

set -e

echo "Проверка insecure-manifests (должны быть отклонены):"
for f in insecure-manifests/*.yaml; do
  echo "$f:"
  kubectl apply -f "$f" && echo "Пропущен (ошибка)" || echo "Отклонён как ожидалось"
done

echo ""
echo "Проверка secure-manifests (должны быть приняты):"
for f in secure-manifests/*.yaml; do
  echo "$f:"
  kubectl apply -f "$f"
done
