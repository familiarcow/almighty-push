#!/bin/bash
# Renders Rinnegan eyes with dynamic gap based on terminal width
# Usage: rinnegan.sh [width]
WIDTH="${1:-$(tput cols 2>/dev/null || echo 90)}"
exec python3 "$(dirname "$0")/rinnegan.py" "$WIDTH"
