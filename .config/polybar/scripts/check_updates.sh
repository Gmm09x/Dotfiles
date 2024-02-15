#!/bin/bash

# Check for updates on Debian
apt_update_info=$(apt update 2>/dev/null)
security_updates=$(apt list --upgradable 2>/dev/null | grep -c "\[security\]")

# Display symbol, count, and security update information
if [ "$security_updates" -gt 0 ]; then
    echo " $security_updates (Security Updates)"
else
    echo " 0"
fi

# Display detailed package information
if [ "$security_updates" -gt 0 ]; then
    echo "Security Update Information:"
    apt list --upgradable | grep "\[security\]"
fi

