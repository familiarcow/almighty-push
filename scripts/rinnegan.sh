#!/bin/bash
# Renders Rinnegan eyes with dynamic gap based on terminal width
# Usage: rinnegan.sh [width]
# If no width given, tries terminal width, falls back to 90

WIDTH="${1:-$(tput cols 2>/dev/null || echo 90)}"

# Left eye lines (narrow at top-left, wide at bottom-right)
LEFT=(
"░░░███  █░░░░░░░░░"
"░█████  ░░░░░█████"
"████░░  ░████████░"
"███░░░░███  ░░░░  ░░░░░░░░"
"██░░░░████  ░░░█  ██████░░"
"█░░░████░░  ░███  ████████"
"    ████░░░████░░░░░░░░░  ██░░"
"    ███░░░░███░░░░●●●░░░  ██░░"
"    ███░░░░███░░░░●●●░░░  ██░░"
"      ██░░░████░░░░░░░░░████░░░███"
"      ██░░░░░█████████████░░░░░███"
"      ████░░░░░█████████░░░░░████░"
"                  ░░░░  ░░░█████░░░░██"
"                  ░░░░  ██████░░░░░███"
"                  ████  ██░░░░░░░█████"
)

# Right eye lines (narrow at top-right, wide at bottom-left — mirrors left eye)
RIGHT=(
"         ░░░░░░░░░░  █████░░░"
"         ███████░░░  ░░█████░"
"         ░░░███████  ░░░░████"
"█░░░░░░░  ░░░░  █████░░░░█"
"░░░░████  ███░  ░░████░░░░"
"░░██████  ████  ░░░░████░░"
"███░░░████░░░░░░░░░████░░░██"
"██░░░░███░░░░●●●░░░░███░░░░█"
"██░░░░███░░░░●●●░░░░███░░░░█"
"░████░░░████░░░░░░░░░████░░░"
"░████░░░░░█████████████░░░░░"
"░░░████░░░░░█████████░░░░░██"
"████░░░░█████░░░░░░░"
"░████░░░░░████████░░"
"░░█████░░░░░░░██████"
)

# Find max widths
MAX_LEFT=0
for line in "${LEFT[@]}"; do
    len=${#line}
    (( len > MAX_LEFT )) && MAX_LEFT=$len
done

MAX_RIGHT=0
for line in "${RIGHT[@]}"; do
    len=${#line}
    (( len > MAX_RIGHT )) && MAX_RIGHT=$len
done

# Calculate gap
TOTAL_EYES=$((MAX_LEFT + MAX_RIGHT))
GAP=$((WIDTH - TOTAL_EYES))

# Minimum gap of 4, max gap of 30
(( GAP < 4 )) && GAP=4
(( GAP > 30 )) && GAP=30

GAP_STR=$(printf '%*s' "$GAP" '')

echo ""
for i in "${!LEFT[@]}"; do
    left="${LEFT[$i]}"
    right="${RIGHT[$i]}"
    padded_left=$(printf "%-${MAX_LEFT}s" "$left")
    printf "%s%s%s\n" "$padded_left" "$GAP_STR" "$right"
done
echo ""
