#!/bin/bash

# Function to toggle detailed Wi-Fi information
toggle_detail() {
    if [ -f "$HOME/.config/polybar/.wifi_show_detail" ]; then
        rm "$HOME/.config/polybar/.wifi_show_detail"
    else
        touch "$HOME/.config/polybar/.wifi_show_detail"
    fi
}

# Function to get the Wi-Fi SSID
get_ssid() {
    essid=$(iw dev wlan0 link | grep SSID | sed 's/^\s*SSID: //')
    echo "$essid"
}

# Function to get the Wi-Fi quality
get_quality() {
    quality=$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
    echo "$quality%"
}

# Function to get the Wi-Fi connection status
get_status() {
    if iw dev wlan0 link >/dev/null 2>&1; then
        echo " Connected"
    else
        echo "󰤯 Disconnected"
    fi
}

# Function to get the Wi-Fi IP address
get_ip_address() {
    ip_address=$(ip addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
    echo "$ip_address"
}

# Main function to display Wi-Fi information
main() {
    ssid=$(get_ssid)
    quality=$(get_quality)
    status=$(get_status)
    ip_address=$(get_ip_address)

    if [ -f "$HOME/.config/polybar/.wifi_show_detail" ]; then
        echo "SSID: $ssid | Quality: $quality | Status: $status | IP: $ip_address"
    else
        echo "Wi-Fi: $status"
    fi
}

# Check if Polybar sent a click event
if [ "$1" = "toggle" ]; then
    toggle_detail
else
    main
fi

