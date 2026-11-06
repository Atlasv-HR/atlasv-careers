#!/usr/bin/env bash
# 部署到公司 AWS：https://hr.etm.tech/careers/
# 路由在 pulse-dance 仓库（caddy/Caddyfile 的 handle_path /careers/* + caddy 只读挂载 ./careers:/srv/careers）
# 本脚本只负责把文件同步到宿主 /home/ubuntu/work/careers，不需要重建任何容器。
# 用法：./deploy.sh
set -euo pipefail

IP=$(dig +short hr.etm.tech | head -1)
[ -n "$IP" ] || { echo "解析 hr.etm.tech 失败"; exit 1; }

echo "== 同步到 $IP:/home/ubuntu/work/careers"
COPYFILE_DISABLE=1 tar czf - \
  --exclude='.git' --exclude='.DS_Store' --exclude='._*' . \
  | ssh -i ~/.ssh/id_hr_pulse "ubuntu@$IP" \
    'mkdir -p /home/ubuntu/work/careers && tar xz -C /home/ubuntu/work/careers 2>/dev/null; find /home/ubuntu/work/careers -name "._*" -delete'

echo "== 核对 sha256（两边一致即上线成功）"
ssh -i ~/.ssh/id_hr_pulse "ubuntu@$IP" 'shasum -a 256 /home/ubuntu/work/careers/index.html'
shasum -a 256 index.html
curl -s -o /dev/null -w "== live https://hr.etm.tech/careers/  HTTP %{http_code}\n" https://hr.etm.tech/careers/
