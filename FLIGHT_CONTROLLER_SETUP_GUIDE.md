# Flight Controller Setup Guide: SpeedyBee F405 Wing Mini (INAV)

This guide covers the installation and configuration of the SpeedyBee F405 Wing Mini with the following hardware:
- **VTX:** AKK Race Ranger
- **Camera:** CADDX FPV Ant
- **GPS:** BN-880 (with Compass)
- **Receiver:** Radiomaster ELRS-RP3-V2
- **Radio:** Radiomaster Pocket
- **Goggles:** Eachine EV800D

---

## 1. Wiring & Custom Cables

### **A. GPS & Compass (BN-880)**
The BN-880 and the SpeedyBee F405 Wing Mini both use 6-pin SH1.0 connectors, but the **pinouts are different**. You must repin the cable or solder directly to the pads.

| BN-880 Pin | Function | FC Pad (Front) | FC Connector (Back) |
| :--- | :--- | :--- | :--- |
| 1 | SDA | SDA | Pin 1 (SDA) |
| 2 | GND | G | Pin 4 (G) |
| 3 | TX | RX3 | Pin 5 (RX3) |
| 4 | RX | TX3 | Pin 6 (TX3) |
| 5 | VCC (5V) | 4V5 | Pin 3 (V) |
| 6 | SCL | SCL | Pin 2 (SCL) |

**Note:** Connecting to `4V5` instead of `5V` or `V` allows the GPS and Receiver to be powered by the USB cable during configuration.

### **B. Servo Power & ESC Connection**
The SpeedyBee F405 Wing Mini has a unique power layout. By default, the servo pins (**Vx**) have **NO POWER**, even when a battery is plugged in.

1.  **Activate Servo BEC:** You MUST solder the two pads of the **"Servo BEC Power Supply Jumper"** on the **back of the PDB board** shut. This connects the internal 4.5A BEC to the servo rail.
2.  **ESC Wiring (S1):** For safety and reliability, use the FC's internal BEC to power servos, not the ESC's.
    *   **Depin Red Wire:** Use a small needle to lift the plastic tab on the ESC's 3-wire connector and pull the **Red (5V)** wire out. Wrap it in electrical tape.
    *   **Connect to S1:** Plug the ESC (now with only Signal and Ground) into the **S1** pins.
3.  **Servo Connections:** Plug your servos into **S2 (Roll), S3 (Pitch), and S4 (Yaw)**.

### **C. VTX & Camera (AKK Race Ranger & CADDX Ant)**
To ensure clean video, we will power the camera from the VTX's filtered 5V output.

1.  **VTX to FC:**
    - **7-26V In** -> **Vv** (Ensure the VTX Power Jumper on the PDB is set to **BAT** for 2S-6S).
    - **GND** -> **G**
    - **Video** -> **Vi** (Video Output from FC OSD)
    - **Smart Audio** -> **T5** (UART5 TX)
2.  **Camera to VTX/FC:**
    - **VCC** -> **AKK 5V Output**
    - **GND** -> **AKK GND**
    - **Video** -> **C1** (Video Input to FC OSD)

### **C. Receiver (Radiomaster RP3-V2)**
The RP3-V2 uses UART1.

- **5V** -> **4V5** (Powers RX via USB)
- **GND** -> **G**
- **TX** -> **RX1**
- **RX** -> **TX1**

---

## 2. Software Setup (INAV)

### **Linux-Specific Preparation**
If you are using Linux, you must grant permissions for your user to access the STM32 bootloader (DFU mode) and serial ports.

1.  **Create udev rule for DFU mode:**
    ```bash
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0664", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/45-stdfu.rules
    ```
2.  **Add your user to necessary groups:**
    ```bash
    sudo usermod -aG dialout,plugdev $USER
    ```
3.  **Reload rules:**
    ```bash
    sudo udevadm control --reload-rules && sudo udevadm trigger
    ```
*Note: You may need to log out and back in for group changes to take effect.*

### **Step 1: Flashing Firmware**
1.  Download and open the **INAV Configurator**.
2.  Connect the FC to your PC via USB while holding the **BOOT** button.
3.  In the "Firmware Flasher" tab:
    - Select Target: `SPEEDYBEEF405WING`.
    - Select the latest stable version.
    - Click **Load Firmware [Online]** then **Flash Firmware**.

### **Step 2: IMU Calibration**
1.  Connect to the FC.
2.  Go to the **Calibration** tab.
3.  Place the aircraft on a level surface and follow the 6-step calibration process for the Accelerometer.

### **Step 3: Ports Configuration**
In the **Ports** tab, set the following and click **Save and Reboot**:
- **UART1:** Serial RX (for ELRS).
- **UART3:** GPS.
- **UART5:** Peripherals -> **TBS SmartAudio**.

### **Step 4: Configuration Tab**
- **Board Alignment:**
    - Due to the narrow profile of the Pod, the FC is often mounted on its side.
    - **Roll Degrees:** `-90`
    - **Yaw Degrees:** `180`
    - **Verification:** In the **Setup** tab, the 3D model must move exactly like the physical aircraft.
- **Receiver:**
    - Receiver Mode: **Serial-based receiver**.
    - Serial Receiver Provider: **CRSF**.
- **GPS:**
    - Enable **GPS for navigation and telemetry**.
    - Protocol: **UBLOX**.
    - Ground Assistance: **Auto**.
- **Compass:**
    - Enable **Magnetometer**.
    - Select **HMC5883** (or QMC5883 if not detected).
    - Alignment: Typically `CW 270 Flip` if mounted flat, but check the map orientation.

---

## 3. Testing Procedures

### **Test 1: FPV System**
1.  Attach antennas to the VTX and Goggles (NEVER power VTX without antenna).
2.  Power the FC via battery.
3.  Set your Eachine EV800D to the frequency configured on the AKK Race Ranger.
4.  **Verification:** You should see the CADDX Ant video feed with the INAV OSD overlay.

### **Test 2: GPS & Compass**
1.  Take the aircraft outside or near a window.
2.  In the INAV **GPS** tab, wait for 3D Fix (indicated by Blue LED on BN-880).
3.  **Verification:** You should see your coordinates and at least 6+ satellites. In the **Setup** tab, ensure the 3D model moves correctly when you rotate the plane (Compass check).

### **Test 3: Radio Control (Static Test)**
1.  **Bind:** Power the RP3-V2 on/off 3 times to enter bind mode (Fast green flash). On your Radiomaster Pocket, run the ExpressLRS LUA script and hit **Bind**.
2.  **Verify Channels:** In the **Receiver** tab, move your sticks.
    - Roll -> Channel 1
    - Pitch -> Channel 2
    - Throttle -> Channel 3
    - Yaw -> Channel 4
3.  **Failsafe:** Turn off the radio; ensure the "Failsafe" indicator in INAV turns Red.

---

## 4. Final Checklist Before Flight
- [ ] Check Motor/Servo directions in the **Outputs** tab.
- [ ] Verify Failsafe behavior (Motor cut).
- [ ] Calibrate the Battery Voltage in the **Power & Battery** tab.
- [ ] Set up Modes (Arm, Angle/Horizon, Nav Launch, RTH) on your radio switches.

Absolutely! Here’s a concise **README-style guide** combining everything you need to set up a new **EdgeTX profile** and get your **INAV flight controller** running for a fixed-wing drone like your MKBD F405 Wing Mini:

---

# README: EdgeTX + INAV Setup for Fixed-Wing (MKBD F405 Wing Mini)

## 1. Create a New Model in EdgeTX

1. **Power on** Radiomaster Pocket.
2. Press **MENU → MODEL → Select an empty slot**.
3. Choose **New Model** (or **Copy Model** to clone an old setup).
4. Enter a **model name** (e.g., `MKBD Wing`).
5. Select **Airplane / Wing** as model type.
6. Assign **External Module → Protocol = CRSF** for ELRS receiver.
7. Save the model.

---

## 2. Configure Inputs

| Function          | Input / Channel |
| ----------------- | --------------- |
| Aileron           | CH1             |
| Elevator / Elevon | CH2             |
| Throttle / Motor  | CH3             |
| Rudder            | CH4             |
| Arm / AUX switch  | CH5             |

* Verify stick movement in **Inputs tab**; bars should move with the stick.
* Adjust **Reverse / Expo** if servo direction or sensitivity is wrong.

---

## 3. Assign Arming Switch

1. Go to **MODEL SETUP → MODES**.
2. Add a **Mode → ARM/DISARM**.
3. Assign your **AUX switch channel** (e.g., CH5) and define the armed range.
4. Press **Save**.
5. Motor will only respond when armed; servos move even when disarmed.

---

## 4. Map Motor Output in INAV

1. Go to **Configuration → Resource / Pin Assignments**.
2. Assign **Motor 1** to the pin connected to your ESC (typically **S1**).
3. Disable **Motor Stop** for immediate response.
4. In **Mixer tab**, add:

| Output  | Source | Scale |
| ------- | ------ | ----- |
| Motor 1 | THR    | 100%  |

5. Save and reboot the FC.

---

## 5. Configure Servo Outputs

| FC Pin | Function                          |
| ------ | --------------------------------- |
| S2     | Left Aileron                      |
| S3     | Right Aileron (reverse if needed) |
| S4     | Elevator                          |
| S5     | Rudder                            |

* In **Mixer tab**, assign outputs to sources: AIL, AIL2, ELE, RUD.
* Enable **Reverse** for any servo moving opposite direction of stick input.

---

## 6. Bind ELRS Receiver

1. Put receiver in **bind mode**.
2. In EdgeTX: **MODEL SETUP → EXTERNAL MODULE → Bind**.
3. Confirm **Status = ON**, **Baudrate = 500k**, **Receiver = CRSF**.
4. Verify stick movement in **Receiver tab** of INAV.

---

## 7. Testing Checklist (No Propeller)

1. Check **Ailerons** move opposite directions with roll stick.
2. Check **Elevator** moves up/down with pitch stick.
3. Check **Rudder** moves left/right with yaw stick.
4. Arm the FC using your **arm switch** (CH5).
5. Slowly move **Throttle**; Motor 1 bar should respond.

---

## 8. Tips / Troubleshooting

* **Throttle input moves in Receiver tab but Motor bar doesn’t** → check Motor 1 pin assignment & mixer.
* **Servo moves opposite** → toggle **Reverse** in Mixer tab.
* **No receiver input** → ensure **External Module → CRSF / 500k / Status ON** is set per model.
* Always **remove propeller** when testing motor.

---

This README provides a **step-by-step reference** for creating a working EdgeTX profile and configuring the MKBD F405 Wing Mini in INAV.

---

If you want, I can make a **diagram showing the full FC pinout with motor and control surfaces, plus channel mapping from EdgeTX**, which makes this README visual and easier to follow.

Do you want me to make that diagram?

