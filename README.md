# Bluetooth MX Keys Autoconnect

This script helps automatically connect your Logitech MX Keys (or similar Bluetooth device) to your Linux machine using `bluetoothctl`.

## Prerequisites

- Linux OS with `bluez` installed (provides `bluetoothctl`).
- A Bluetooth adapter.

## Setup Instructions

### 1. Find your Device MAC Address

First, you need to find the MAC address of your keyboard. You can do this by checking already paired devices or scanning for new ones.

**Option A: If your device is already paired**
1.  Open a terminal.
2.  Run the command `bluetoothctl devices`.
3.  You will see a list of known devices. Look for your keyboard's name (e.g., "MX Keys").
4.  The code next to it (like `DC:70:A7:83:00:49`) is the MAC address.

**Option B: If scanning for a device (Detailed)**
1.  Open a terminal and run `bluetoothctl`.
2.  In the prompt, enter the following commands to set up the agent and start scanning:
    ```
    agent on
    default-agent
    power on
    discoverable on
    pairable on
    scan on
    ```
3.  Put your keyboard in pairing mode.
4.  When you see your device (e.g., `[NEW] Device XX:XX:XX:XX:XX:XX MX Keys`), pair it using the MAC address found:
    ```
    pair XX:XX:XX:XX:XX:XX
    ```
5.  **Passkey Pairing:**
    *   If prompted, you may need to enter a passkey.
    *   The terminal might show: `[agent] Passkey: 123456`
    *   Type `123456` on your **Bluetooth keyboard** and press Enter to complete the pairing.

6.  Once paired, you have the MAC address (`XX:XX:XX:XX:XX:XX`) ready for the script.

### 2. Configure the Script

1.  Open the `bt-mxkeys-autoconnect.sh` file.
2.  Replace the value of `DEVICE_MAC` with your own device's MAC address found in the previous step.

    ```bash
    DEVICE_MAC="XX:XX:XX:XX:XX:XX"
    ```

### 3. Make Executable

Make the script executable by running:

```bash
chmod +x bt-mxkeys-autoconnect.sh
```

## Usage

### Run Manually

You can run the script manually from the terminal to connect:

```bash
./bt-mxkeys-autoconnect.sh
```

### Run on Startup (Optional)

To have this run automatically when you log in, you can add it to your Startup Applications.

1.  Open your distribution's "Startup Applications" or "Autostart" settings.
2.  Add a new entry.
3.  Set the command to the full path of the script, for example:
    `/home/yourusername/path/to/bt-mxkeys-autoconnect.sh`
