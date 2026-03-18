#!/bin/bash
# Renders Rinnegan eyes with dynamic gap based on terminal width
# Usage: rinnegan.sh [width]
# If no width given, uses terminal width (tput cols)

WIDTH="${1:-$(tput cols 2>/dev/null || echo 90)}"

# Left eye lines (trimmed)
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

# Right eye lines (trimmed)
RIGHT=(
"░░░░░░░░░░  █████░░░"
"███████░░░  ░░█████░"
"░░░███████  ░░░░████"
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

# Find max left width for alignment
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

# Calculate gap: fill remaining space between eyes
TOTAL_EYES=$((MAX_LEFT + MAX_RIGHT))
GAP=$((WIDTH - TOTAL_EYES))

# Minimum gap of 4, max gap of 40 (beyond that it looks disconnected)
(( GAP < 4 )) && GAP=4
(( GAP > 40 )) && GAP=40

# Build gap string
GAP_STR=$(printf '%*s' "$GAP" '')

# Print with blank line above
echo ""
for i in "${!LEFT[@]}"; do
    left="${LEFT[$i]}"
    right="${RIGHT[$i]}"
    # Pad left to MAX_LEFT
    padded_left=$(printf "%-${MAX_LEFT}s" "$left")
    printf "%s%s%s\n" "$padded_left" "$GAP_STR" "$right"
done
echo ""
