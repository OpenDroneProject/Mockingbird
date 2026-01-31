# Electronics Setup

## Plugging Everything In

TODO: add pictures
TODO: explain what channel connects to what
TODO: tell the user to label setuff

## Binding ELRS

### Traditional Method (No Binding Phrase)

1. Power the receiver on and off three times consecutively (with roughly 2-second intervals).
2. The LED should start blinking twice in a cycle, indicating it is in binding mode.
3. Open the ExpressLRS LUA script on your transmitter and select the [Bind] option.
4. The receiver LED will turn solid when successfully paired.

### Binding Phrase Method (Recommended)

1. Use the ELRS Configurator to flash both your transmitter and receiver with a custom binding phrase.
2. Power on the receiver. It will automatically bind with the transmitter without needing button presses or power cycling.

[How to flash ELRS via WIFI](https://www.youtube.com/watch?v=8poK--ln5J0)

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
