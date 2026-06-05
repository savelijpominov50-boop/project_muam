#!/usr/bin/env bash
set -uo pipefail

# @file test_security.sh
# @brief Интеграционный автотест FIM

log_result() {
    if [ "$1" -eq 0 ]; then echo "[УСПЕХ] $2"; else echo "[ОШИБКА] $2"; exit 1; fi
}

sudo -u nobody cat /etc/shadow > /dev/null 2>&1 || true
sleep 2

if ausearch -k security_alert -ts recent | grep -q "key=\"security_alert\""; then
    log_result 0 "Событие зафиксировано."
else
    log_result 1 "Событие НЕ зафиксировано."
fi
exit 0