#!/usr/bin/env python3

import subprocess

def get_bluetooth_status():
    try:
        # Run the rfkill command to check Bluetooth status
        result = subprocess.run(['rfkill', 'list', 'bluetooth'], capture_output=True, text=True, check=True)

        # Check the output for the Bluetooth status
        if 'Soft blocked: yes' in result.stdout:
            return 'Bluetooth: Off'
        else:
            return 'Bluetooth: On'
    except subprocess.CalledProcessError as e:
        # Handle errors gracefully
        print(f"Error: {e}")
        return 'Bluetooth: Unknown'

def main():
    # Get the Bluetooth status
    bluetooth_status = get_bluetooth_status()

    # Output the status
    print(bluetooth_status)

if __name__ == "__main__":
    main()

