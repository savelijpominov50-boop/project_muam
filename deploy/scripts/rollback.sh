#!/usr/bin/env bash
set -euo pipefail

# @file rollback.sh
# @brief Откат изменений
# @version 1.0.0

if [ "$EUID" -ne 0 ]; then exit 1; fi
ufw --force disable
rm -f /etc/sysctl.d/99-hardening.conf
rm -f /etc/audit/rules.d/audit.rules
augenrules --load || true
systemctl restart auditd || true
echo "==> Откат завершен."