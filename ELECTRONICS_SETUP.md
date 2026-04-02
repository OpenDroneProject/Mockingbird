# Electronics Setup

## Plugging Everything In

TODO: add pictures
TODO: explain what channel connects to what
TODO: tell the user to label setuff

## Radiomaster Setup

### 1. Enabling Internal RF (Fixes LUA "Loading" Hang)
The Radiomaster Pocket must have its internal module powered and set to the correct protocol to communicate with ELRS.
1.  Press the **[MDL]** button.
2.  Press **[PAGE >]** once to reach the **SETUP** page.
3.  Scroll down to **Internal RF**.
4.  Set **Mode** to **CRSF** (this enables the ELRS module).
5.  Ensure **External RF** is set to **OFF**.

### 2. Binding ELRS

#### Traditional Method (No Binding Phrase)
1. Power the receiver on and off three times consecutively (with roughly 2-second intervals).
2. The LED should start blinking twice in a cycle, indicating it is in binding mode.
3. Open the ExpressLRS LUA script on your transmitter ([SYS] -> ExpressLRS) and select the **[Bind]** option.
4. The receiver LED will turn solid when successfully paired.

#### Binding Phrase Method (Recommended via Wi-Fi)
This method allows you to "lock" your radio to your receiver without manual binding. You must set the **same phrase** on both.

**A. Configure the Radio (Transmitter):**
1.  Open the **ExpressLRS** LUA script on your radio ([SYS] -> ExpressLRS).
2.  Select **[WiFi Enable]**.
3.  On your PC/Phone, connect to the Wi-Fi network: `ExpressLRS TX` (Password: `expresslrs`).
4.  Open a browser to `http://10.0.0.1`.
5.  Enter your custom **Binding Phrase** and click **Save**.

**B. Configure the Receiver (RP3-V2):**
1.  **Power On:** Plug in the drone's battery or connect the flight controller to your PC via USB (if the receiver is powered by the FC's USB).
2.  **Wait for Wi-Fi Mode:** Wait exactly **60 seconds** without turning on your radio.
    *   The LED will first blink slowly (searching for radio).
    *   After 60 seconds, the LED will start **flashing rapidly**, indicating it is now in Wi-Fi mode.
3.  **Connect:** On your phone or PC, look for the Wi-Fi network: `ExpressLRS RX` (Password: `expresslrs`).
4.  **Configure:** Open your browser and go to `http://10.0.0.1`.
5.  **Save Phrase:** Type the **exact same Binding Phrase** used on the radio into the text box and click **Save & Reboot**.

**C. Result:**
Once both devices reboot, they will instantly pair (LED will turn **Solid Green**) as long as they share the same phrase.

## PWM Control Pin Layout (INAV)

For the **SpeedyBee F405 Wing Mini** using the standard Airplane mixer, connect your components to the following pins:

| Pin Label | INAV Mixer | Control Axis | Component |
| :--- | :--- | :--- | :--- |
| **S1** | Motor 1 | Throttle | ESC Signal Wire |
| **S2** | Servo 1 | Roll | Left Aileron Servo |
| **S3** | Servo 2 | Pitch | Elevator Servo |
| **S4** | Servo 3 | Yaw | Rudder Servo |
| **S5** | Servo 4 | Roll | Right Aileron Servo (Optional) |

**Note on Power:** Servos are powered by the built-in BEC. Ensure the **Servo Power Jumper** on the PDB board is bridged for the desired voltage (5V for standard servos, 6V for high-torque).

## Calibrating Motor

1. **Preparation:** Connect the BLDC motor to the ESC. Connect the ESC signal wire to your receiver (usually Channel 3) or servo tester.
2. **Maximum Throttle:** Turn on the transmitter and set the throttle stick to maximum (full up).
3. **Power On:** Plug the battery into the ESC. The motor will beep to indicate it has recognized the maximum throttle position.
4. **Minimum Throttle:** As soon as the beeping stops (or a musical tone is heard), move the throttle stick to the minimum position (full down).
5. **Confirmation:** The ESC will produce a series of beeps indicating the number of battery cells, followed by a long beep, confirming successful calibration.
6. **Finalize:** Unplug the battery, then plug it back in. The ESC is now calibrated and ready to use. 

## Radiomaster Setup

TODO: ADD PICTURES

---
  Radiomaster Pocket Button Layout

  [PAGE <]  [PAGE >]      ← Top shoulder buttons

           [SPEAKER]
  [SYS]               [MDL]    ← Side buttons

      [SCROLL WHEEL]           ← Press to select, rotate to navigate

  [RTN]                        ← Bottom left, goes back/exits

  ---
  Step 1: Create a New Model

  1. Press MDL button (right side of speaker)
  2. You'll see a list of model slots (some empty, some with names)
  3. Rotate scroll wheel to highlight an empty slot
  4. Press scroll wheel to open submenu
  5. Select Create Model → press scroll wheel to confirm
  6. A new model is created and you're now in its settings

  ---
  Step 2: Name Your Model

  1. After creating, press PAGE > once to reach the Setup menu
  2. First option is Model Name - it will show a default name like "Model01"
  3. Press scroll wheel to enter edit mode
  4. You're now in the character editor:
    - Rotate scroll wheel to change the current character (cycles through A-Z, a-z, 0-9, symbols)
    - Press scroll wheel to confirm that character and move to the next position
    - Repeat for each character
  5. When done, press RTN to save the name and exit editor

  ---
  Step 3: Configure Internal RF Module

  Still in the Setup menu:

  1. Rotate scroll wheel down to find Internal RF
  2. Press scroll wheel to edit
  3. Set Mode to CRSF (this enables ELRS)
  4. Press RTN to exit
  5. Scroll down to verify Receiver shows a number (receiver ID)

  ---
  Step 4: Set Up Channels (Method A: Wizard - Easiest)

  1. Press RTN to go back to home screen
  2. Press SYS button (left side of speaker)
  3. You're in the Tools menu
  4. Rotate scroll wheel to find Wizard Loader
  5. Press scroll wheel to open it
  6. Select Multi (for quadcopter/drone)
  7. Follow the prompts:
  ┌──────────────────┬────────────────────────────────────────────────────────────────────┐
  │      Prompt      │                             What to do                             │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Throttle Channel │ Leave as CH3, press scroll wheel                                   │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Roll Channel     │ Leave as CH1, press scroll wheel                                   │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Pitch Channel    │ Leave as CH2, press scroll wheel                                   │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Yaw Channel      │ Leave as CH4, press scroll wheel                                   │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Arm Switch       │ Select SA (2-position switch on left shoulder), press scroll wheel │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Mode Switch      │ Select SB (3-position switch), press scroll wheel                  │
  ├──────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Beeper Switch    │ Select SC or SD, press scroll wheel                                │
  └──────────────────┴────────────────────────────────────────────────────────────────────┘
  8. On confirmation screen, long-press scroll wheel to finish
  ---
  Sources:
  - https://www.flitetest.com/articles/creating-a-new-model-on-the-radiomaster-pocket
  - https://oscarliang.com/setup-radiomaster-pocket/
