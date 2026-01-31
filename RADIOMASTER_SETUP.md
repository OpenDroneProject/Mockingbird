# Electronics Setup


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
  Step 4: Set Up Channels (Method B: Manual)

  Navigate to Mixes

  1. From home screen with your model selected, press MDL
  2. Press PAGE > three times to reach Mixes

  Add Arm Switch to CH5

  1. Scroll down to CH5 (it will be empty)
  2. Press scroll wheel → select Edit (or just press to add)
  3. You'll see a source selection screen
  4. Flip the switch you want to use (e.g., SA) - the radio auto-detects it
  5. The source will show SA (or whichever switch you flipped)
  6. Press RTN to save

  Add Flight Mode Switch to CH6

  1. Scroll to CH6
  2. Press scroll wheel
  3. Flip switch SB (3-position switch)
  4. Press RTN

  Add Beeper to CH7

  1. Scroll to CH7
  2. Press scroll wheel
  3. Flip switch SC or SD
  4. Press RTN

  ---
  Step 5: Verify Your Setup

  1. Press RTN until you're at the home screen
  2. Press MDL → PAGE > three times to Mixes
  3. Move sticks and flip switches - you should see the channel values change on screen:
  ┌─────────┬────────┬──────────────────────────────────────────┐
  │ Channel │ Source │              Expected Value              │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH1     │ Ail    │ -100 to +100 with right stick left/right │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH2     │ Ele    │ -100 to +100 with right stick up/down    │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH3     │ Thr    │ -100 to +100 with left stick up/down     │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH4     │ Rud    │ -100 to +100 with left stick left/right  │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH5     │ SA     │ Jumps between -100/+100 when flipped     │
  ├─────────┼────────┼──────────────────────────────────────────┤
  │ CH6     │ SB     │ Shows -100/0/+100 for 3 positions        │
  └─────────┴────────┴──────────────────────────────────────────┘
  ---
  Quick Reference: Switch Names on Radiomaster Pocket
  ┌────────┬───────────────────────┬────────────┬──────────────┐
  │ Switch │       Location        │ Positions  │   Good For   │
  ├────────┼───────────────────────┼────────────┼──────────────┤
  │ SA     │ Left shoulder, front  │ 2-position │ Arm          │
  ├────────┼───────────────────────┼────────────┼──────────────┤
  │ SB     │ Left shoulder, back   │ 3-position │ Flight modes │
  ├────────┼───────────────────────┼────────────┼──────────────┤
  │ SC     │ Right shoulder, front │ 2-position │ Beeper       │
  ├────────┼───────────────────────┼────────────┼──────────────┤
  │ SD     │ Right shoulder, back  │ 2-position │ Turtle mode  │
  └────────┴───────────────────────┴────────────┴──────────────┘
  ---
  Sources:
  - https://www.flitetest.com/articles/creating-a-new-model-on-the-radiomaster-pocket
  - https://oscarliang.com/setup-radiomaster-pocket/
