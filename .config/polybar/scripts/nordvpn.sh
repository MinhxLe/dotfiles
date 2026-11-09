#!/usr/bin/env sh
# NordVPN on/off indicator for polybar

if ip link show nordlynx >/dev/null 2>&1 || ip link show nordtun >/dev/null 2>&1; then
  echo "%{F#286983}󰕥 VPN%{F-}"
else
  echo "%{F#9893a5}󰦞 VPN off%{F-}"
fi
