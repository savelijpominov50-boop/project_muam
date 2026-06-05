# Система контроля целостности ОС и мониторинга безопасности (Проект №46)

Репозиторий содержит инфраструктуру как код (IaC) для развертывания системы FIM (File Integrity Monitoring) и аудита системных вызовов ядра Linux на базе ELK-стека.

## Лицензирование
* Исходный код: **MIT**
* Документация: **CC BY-SA 4.0**

## Быстрый старт
Полное руководство: `docs/deployment.md`.
```bash
sudo ./deploy/scripts/bootstrap.sh
cd deploy && docker compose up -d