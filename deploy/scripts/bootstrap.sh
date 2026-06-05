#!/usr/bin/env bash
set -euo pipefail

# @file bootstrap.sh
# @brief Подготовка ОС Linux
# @version 1.0.0

echo "==> Инициализация хоста <=="
if [ "$EUID" -ne 0 ]; then
    echo "Ошибка: Нужен sudo." >&2
    exit 1
fi

apt-get update -y && apt-get install -y ufw auditd
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 5601/tcp
ufw --force enable

cp ../../config/sysctl.d/99-hardening.conf /etc/sysctl.d/99-hardening.conf
sysctl --system

cp ../../config/auditd/audit.rules /etc/audit/rules.d/audit.rules
augenrules --load

if [ ! -f ../../.env ]; then
    cp ../../.env.example ../../.env
fi
echo "==> Успех."