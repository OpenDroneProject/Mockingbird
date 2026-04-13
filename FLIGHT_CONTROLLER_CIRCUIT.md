# Flight Controller Circuit Design

Custom fixed-wing flight controller stack designed for INAV. Supports IMU, GNSS, analog VTX, analog camera, and ELRS receiver. Servo and ELRS pins are hand-soldered Dupont headers by the end user.

---

## Development Strategy

A "strangler fig" approach is used — each custom board is validated against the SpeedyBee F405 Wing Mini before the next is designed. At every stage a fully functional flying system exists with only one new unknown variable.

| Stage | PDB | FC | Flasher |
|-------|-----|----|---------|
| 1 | SpeedyBee | SpeedyBee | **Ours** |
| 2 | **Ours** | SpeedyBee | Ours |
| 3 | Ours | **Ours** | Ours |

### Open Items Before Starting
- Measure the SpeedyBee FC board's USB extender connector pinout (physical silkscreen + continuity check)
- Measure the SpeedyBee PDB↔FC 12-pin stacking connector pinout (physical silkscreen + continuity check)

---

## Stack Architecture

Three permanent boards stack from bottom to top via 2×6 2.54mm stacking pin headers:

```
┌─────────────────────┐
│      FC Board       │  STM32F405, IMU, OSD, all JST connectors
└─────────────────────┘
           ↕  2×6 stacking header
┌─────────────────────┐
│      PDB Board      │  Battery input, 5V BEC, 6V BEC
└─────────────────────┘
```

The flasher accessory board is not a permanent stack member. It connects to the FC board via a cable when flashing is needed.

---

## Inter-Board Connectors

### PDB → FC (2×6 2.54mm stacking header)

| Pin | Row A | Row B |
|-----|-------|-------|
| 1 | GND | GND |
| 2 | GND | GND |
| 3 | VBAT | VBAT |
| 4 | 5V | 5V |
| 5 | 6V | 6V |
| 6 | SPARE | SPARE |

### FC → Flasher (JST SH 1.0mm 10-pin)

| Pin | Signal |
|-----|--------|
| 1 | GND |
| 2 | GND |
| 3 | 5V |
| 4 | 3.3V |
| 5 | USB D+ |
| 6 | USB D− |
| 7 | BOOT0 |
| 8 | NRST |
| 9 | SWDIO |
| 10 | SWDCLK |

---

## Board 1: PDB (Power Distribution Board)

### Purpose
Battery input, spike suppression, reverse polarity protection, and regulated power output to the FC board.

### Large Solder Pads
- **Battery +/−** — main input, sized for XT30 (small wing) or XT60 (larger). Size for 16AWG minimum.
- **ESC +/−** — motor ESC wires solder directly here, on the same high-current copper pour as battery pads
- **Capacitor +/−** — for bulk low-ESR capacitor, same pour

Battery, ESC, and cap pads should all connect on the same wide copper pour. Keep traces short and fat.

### Bill of Materials

#### Power Input & Protection
| Component | Part | Notes |
|-----------|------|-------|
| Bulk capacitor | Panasonic EEUFR1V471 — 470µF 35V low-ESR electrolytic | Through-hole solder pad footprint |
| TVS diode | SMBJ15A (3S) or SMBJ20A (4S) | Select based on max battery voltage |
| Reverse polarity MOSFET | AO4407 (SOP-8, 30V, 12A) | P-channel; gate resistor per datasheet |

#### 5V BEC (~2A)
Powers FC logic, GPS, ELRS, camera, VTX.

| Component | Part | Notes |
|-----------|------|-------|
| Regulator IC | MP2315GJ-Z | 3A synchronous buck, up to 24V input |
| Inductor | Würth 744043100 — 10µH 3A | Or equivalent |
| Supporting passives | Per MP2315 datasheet | Bootstrap cap, input/output caps, feedback resistors |

#### 6V BEC (~3A)
Powers servos.

| Component | Part | Notes |
|-----------|------|-------|
| Regulator IC | MP1584EN | 3A adjustable buck, up to 28V input |
| Inductor | Würth 744043047 — 4.7µH 3A | Or equivalent |
| Supporting passives | Per MP1584 datasheet | Output voltage set by feedback resistor divider |

#### Connectors & Indicators
| Component | Part | Notes |
|-----------|------|-------|
| Stack header | 2×6 2.54mm male through-hole pin header | Pins pointing up toward FC board |
| Battery pads | Large through-hole pads, 2mm drill | Size for 16AWG wire minimum |
| ESC pads | Large through-hole pads, 2mm drill | Same |
| Capacitor pads | Through-hole pads to match cap lead spacing | Match EEUFR1V471 footprint |
| Power LED | 0402 red LED + 1kΩ resistor | On 5V rail |

### Implementation Plan

1. **Schematic (KiCad)**
   - Draw reverse polarity protection: AO4407 gate tied to GND through resistor, source on VBAT+, drain feeds internal VBAT rail
   - Draw 5V BEC using MP2315 application circuit from datasheet
   - Draw 6V BEC using MP1584 application circuit — set output to 6V via feedback resistor values (datasheet provides formula)
   - Connect VBAT, 5V, 6V, and GND pins to the 2×6 stack connector symbol
   - Add large pad symbols for battery, ESC, and capacitor

2. **Layout (KiCad)**
   - Place battery, ESC, and cap pads first along one edge
   - Place TVS and reverse polarity MOSFET immediately adjacent to battery pads, before anything else in the power path
   - Place each BEC circuit close to its output pin on the stack connector
   - Flood the board with GND and VBAT copper pours on opposite layers — keep high-current paths wide and short
   - Route 5V and 6V as wide traces from BEC output caps to stack connector
   - Keep BEC switching nodes (SW pin, inductor) compact to minimize EMI
   - Place power LED near the stack connector edge

3. **Review**
   - Run KiCad DRC — zero errors before ordering
   - Manually verify feedback resistor values produce correct output voltages
   - Check inductor and capacitor voltage/current ratings against worst-case inputs

4. **Fabrication**
   - 2-layer board is sufficient — no high-speed signals
   - Order from JLCPCB; hand-solder through-hole components, SMT assembly optional for BEC ICs

### Success Criteria

**Before applying power**
- Continuity between all GND pads
- No continuity between VBAT, 5V, 6V, or GND rails to each other
- High resistance (MOhm range) from VBAT+ to VBAT− — confirms no dead shorts

**On first power-up**
- Use a bench PSU set to battery voltage with 500mA current limit — if it folds back immediately there is a short
- Power LED illuminates
- Stack connector pin readings:

| Pin | Expected |
|-----|----------|
| GND | 0V reference |
| VBAT | Matches PSU output |
| 5V | 4.9–5.1V |
| 6V | 5.9–6.1V |
| All other pins | 0V or floating |

**Under load**
- Connect dummy load (~500mA on 5V, ~1A on 6V) — voltages stay within ±0.2V of target
- BEC ICs and inductors warm but not hot after 60 seconds

---

## Board 2: FC Board (Flight Controller)

### Purpose
Main flight controller. Hosts the STM32F405RGT6, IMU, OSD chip, and all external connectors for GPS, ELRS, camera, and VTX.

### Bill of Materials

#### Microcontroller
| Component | Part | Notes |
|-----------|------|-------|
| MCU | STM32F405RGT6 | LQFP-64 |
| HSE crystal | Abracon ABM8-8.000MHZ-B2-T — 8MHz | ±20ppm |
| Crystal load caps | 22pF 0402 × 2 | Per crystal datasheet |
| VCAP caps | 1µF 0402 × 2 | VCAP1 and VCAP2 — must be isolated from 3.3V rail |
| BOOT0 pull-down | 10kΩ 0402 | Boots from flash by default; stack/flasher connector overrides |
| NRST filter cap | 100nF 0402 | |
| Decoupling caps | 100nF + 4.7µF at every VDD/VDDA/VDDIO pin | Per STM32F405 datasheet |

> **Note:** VCAP1 and VCAP2 are the output pins of the STM32's internal 1.2V core regulator. They require dedicated 1µF caps to GND and must NOT connect to the 3.3V net. This is a common first-timer mistake.

#### Power
| Component | Part | Notes |
|-----------|------|-------|
| 3.3V LDO | AP2112K-3.3 | SOT-25; takes 5V from stack connector |
| Decoupling caps | Per AP2112K datasheet | |

#### IMU
| Component | Part | Notes |
|-----------|------|-------|
| IMU | ICM-42688-P | SPI interface |
| VDD ferrite bead | 100Ω @ 100MHz | Filters switching noise on IMU supply |
| Decoupling caps | 100nF + 1µF | Per ICM-42688-P datasheet |

#### OSD
| Component | Part | Notes |
|-----------|------|-------|
| OSD chip | AT7456E | SPI to MCU; sits in the video path between camera and VTX |
| Decoupling caps | Per AT7456E datasheet | |

#### JST SH 1.0mm Receptacles
| Connector | Pins | Signals |
|-----------|------|---------|
| GPS | 4 | GND, 5V, TX, RX |
| ELRS | 4 | GND, 5V, TX, RX |
| Camera | 3 | GND, 5V, video in → AT7456E |
| VTX | 4 | GND, 5V, video out from AT7456E, SmartAudio UART TX |

#### Servo Output Pads
- Through-hole 3-pin groups (GND, 6V, signal) × 6
- End user hand-solders male Dupont headers
- Suggested channels: aileron ×2, elevator, rudder, throttle, flaps

#### Voltage Sensing
- Resistor divider from VBAT (stack connector) to STM32 ADC pin
- Allows INAV to report battery voltage in OSD and trigger low-voltage warnings

#### Indicators & Misc
| Component | Part | Notes |
|-----------|------|-------|
| Status LED | 0402 LED + resistor | GPIO-controlled; INAV uses for arming state |
| Buzzer pad | 2-pin through-hole | Passive buzzer for INAV alerts and lost-model beeper |

#### Connectors
| Component | Part | Notes |
|-----------|------|-------|
| PDB stack connector | 2×6 2.54mm female socket (bottom of board) | Mates with PDB stacking header |
| Flasher connector | JST SH 1.0mm 10-pin receptacle | For flasher accessory board cable |

---

## Board 3: Flasher Accessory Board

### Purpose
Connects to the FC board to provide USB-C flashing capability. Not a permanent stack member — attach when flashing, remove during flight. Designed in two versions: one compatible with the SpeedyBee F405 Wing Mini (Stage 1), and one for our custom FC board (Stage 3).

### Stage 1: SpeedyBee-Compatible Flasher

The SpeedyBee FC board exposes a programming interface via its "Wireless USB Extender" connector. Our flasher board mates with this connector and replaces the SpeedyBee wireless extender with a direct USB-C connection.

> **Required before design:** Measure the SpeedyBee FC board's USB extender connector — note connector type, pin count, and silkscreen labels. Confirm with continuity check which pins carry D+, D−, 5V, GND, and whether BOOT0/NRST are exposed.

#### Bill of Materials

| Component | Part | Notes |
|-----------|------|-------|
| USB-C receptacle | GCT USB4135-GF-A | Mid-mount, low profile |
| ESD protection | USBLC6-2SC6 | On D+, D−, and VBUS |
| CC resistors | 5.1kΩ 0402 × 2 | CC1 and CC2 to GND — mandatory for USB-C device role |
| BOOT button | 3×6mm SMD tactile switch | Pulls BOOT0 high if SpeedyBee exposes it; otherwise used only for our custom FC |
| RESET button | 3×6mm SMD tactile switch | Pulls NRST low if SpeedyBee exposes it; otherwise used only for our custom FC |
| Power LED | 0402 LED + 1kΩ resistor | Confirms VBUS is live |
| Decoupling caps | 10µF + 100nF on VBUS | |
| FC connector | TBD — match SpeedyBee USB extender port | Pinout to be measured from physical board |

#### Flashing Procedure (SpeedyBee)
1. Plug flasher board into SpeedyBee USB extender port
2. Connect USB-C to computer
3. Enter DFU mode per SpeedyBee's method (may differ from our custom FC)
4. Flash via INAV Configurator

---

### Stage 3: Custom FC Flasher

Once the custom FC board is designed, the flasher connects via JST SH 1.0mm 10-pin cable. The BOM is identical to the Stage 1 flasher except the FC connector changes.

| Component | Part | Notes |
|-----------|------|-------|
| USB-C receptacle | GCT USB4135-GF-A | Mid-mount, low profile |
| ESD protection | USBLC6-2SC6 | On D+, D−, and VBUS |
| CC resistors | 5.1kΩ 0402 × 2 | CC1 and CC2 to GND |
| BOOT button | 3×6mm SMD tactile switch | Pulls BOOT0 high via JST connector |
| RESET button | 3×6mm SMD tactile switch | Pulls NRST low via JST connector |
| Power LED | 0402 LED + 1kΩ resistor | Confirms VBUS is live |
| Decoupling caps | 10µF + 100nF on VBUS | |
| JST SH 1.0mm receptacle | 10-pin | Connects to custom FC board |

#### Flashing Procedure (Custom FC)
1. Connect flasher board to FC board via JST cable
2. Hold BOOT button
3. Press and release RESET
4. Release BOOT — MCU is now in USB DFU mode
5. Open INAV Configurator and flash firmware

> No LDO needed on either flasher version. 5V from VBUS passes directly to the FC board. The custom FC board's AP2112K generates 3.3V from that; the SpeedyBee has its own onboard regulation.

---

## Cost Estimates

Rough estimates for a first run of 5 boards from JLCPCB, components sourced from LCSC.

### Per-Board Component Cost

#### Flasher Board (~$4–6)
| Item | Cost |
|------|------|
| PCB (2-layer, ~30×20mm, qty 5) | ~$0.50 |
| GCT USB4135-GF-A | ~$0.80 |
| USBLC6-2SC6 | ~$0.30 |
| Tactile switches ×2 | ~$0.20 |
| JST SH 1.0mm 10-pin receptacle | ~$0.40 |
| Passives, LED | ~$0.20 |
| **Total** | **~$2.40** |

#### PDB (~$8–12)
| Item | Cost |
|------|------|
| PCB (2-layer, ~40×40mm, qty 5) | ~$0.60 |
| MP2315GJ-Z (5V BEC) | ~$1.20 |
| MP1584EN (6V BEC) | ~$0.80 |
| Würth inductors ×2 | ~$2.50 |
| Panasonic EEUFR1V471 cap | ~$0.80 |
| AO4407 MOSFET | ~$0.40 |
| SMBJ15A TVS | ~$0.30 |
| 2×6 pin header | ~$0.30 |
| Passives, LED | ~$0.30 |
| **Total** | **~$7.20** |

#### FC Board (~$25–35)
| Item | Cost |
|------|------|
| PCB (4-layer, ~35×35mm, qty 5) | ~$2.50 |
| STM32F405RGT6 | ~$7.00 |
| ICM-42688-P | ~$3.50 |
| AT7456E | ~$3.00 |
| AP2112K-3.3 LDO | ~$0.40 |
| 8MHz crystal | ~$0.40 |
| JST SH 1.0mm receptacles ×4 | ~$1.60 |
| 2×6 female socket + JST SH 10-pin | ~$0.60 |
| Passives, LED, crystal caps | ~$1.50 |
| **Total** | **~$20.50** |

### First-Run Total (qty 5)

| Board | Components | PCB | JLCPCB SMT Setup | First Run (qty 5) |
|-------|------------|-----|------------------|-------------------|
| Flasher | ~$12 | ~$2.50 | ~$15 | ~$30 |
| PDB | ~$36 | ~$3 | ~$20 | ~$60 |
| FC | ~$103 | ~$12.50 | ~$30 | ~$145 |
| **Total** | | | | **~$235** |

### Notes
- JLCPCB SMT setup fees (~$8–20 per unique extended part) dominate at low quantities — per-unit cost drops significantly at qty 10+
- The STM32F405RGT6 is the single biggest cost driver — fine-pitch LQFP-64, SMT assembly strongly recommended over hand-soldering
- ICM-42688-P and AT7456E are also fine-pitch and should be assembled by JLCPCB
- Parts in JLCPCB's Basic parts library have no setup fee — check there first when choosing passives and common ICs
- A second revision typically costs much less since setup fees are not paid again
