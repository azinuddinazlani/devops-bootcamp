#!/bin/bash
curl -fsSL https://get.docker.com | sh
id ssm-user &>/dev/null || useradd -m ssm-user
usermod -aG docker ssm-user
mkdir -p /home/ssm-user/rackula/data
chown -R 1001:1001 /home/ssm-user/rackula
curl -fsSL https://raw.githubusercontent.com/RackulaLives/Rackula/main/deploy/docker-compose.persist.yml -o /home/ssm-user/rackula/docker-compose.yml
cd /home/ssm-user/rackula && docker compose up -d
