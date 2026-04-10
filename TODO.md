# TODO

### Revisons for FC stack
- [x] redesign pod to hold FC
- [x] redesign bottom fairing to accomodate VTX mount changes

- [x] update rear fairing design to house ELRS receiver
- [x] mount GNSS in front fairing

- [ ] re-attach tail with 30-min epoxy

** Configure GPS compass orientation in INAV**
```
align_mag_pitch
align_mag_roll
align_mag_yaw
```

### Software
- [x] Charge battery and plug into FC
- [x] Flash INAV and test IMU
- [x] Test VTX and camera
- [x] solder ELRS
- [x] Test ELRS with servos
- [ ] assemble everything and create guide
- [ ] calibrate IMU
- [ ] get motor working
- [ ] Static plane test 
- [ ] document electronics setup
    - [ ] all parts
    - [ ] soldering
    - [ ] wiring
    - [ ] flashing
    - [ ] setup
        - [ ] inav
        - [ ] edgetx

### Make New Plane
- [x] make the bottom fairing thicker in all dimensions and re-print

### Assembly Guide
- [ ] Full step-by-step assembly guide
- [x] electronics configuration guide
    - [ ] plugging everything in
    - [ ] fix EdgeTX diagrams in electronics, or add images
    - [ ] edge tX inverse mix
- [ ] wiring diagrams
- [ ] electronics BOM

VTX CONNECT TO SPEEDYBEE:
tx5 is smartaudio, vv is voltage+ for the vtx, and VTX is video
so as it is labelled, Vv = 7-26v input, GND = GND, TX5 = smart audio, and VTX = video
        
- [ ] build brand-new drone from scratch (again)
- [ ] update assembly guide with rear fairing, updated CF rod assembly info, opposing servo positions, and updated pushrod configuration (mor authority)
- [ ] update electronics guide
    - [ ] no FC
    - [ ] with FC

## Maiden Flight Feedback

10mph winds with 25mph gusts

Cons: 

Extremely hard to handle in wind due to high aspect, low authority, and torsional displacement of tailfin.

- Too much torsional displacement in tail. Need to try Carbon Fiber tube instead of rod (this should also save on mass a bit)

- Low authority. Attach pushrods to the far end of the servo horn, but close end of the control surface horn.

- all controls had to be inverted. Left roll should raise left aileron, pitch up should raise elevator, yaw right should move rudder right. Document how to invert the mix in edge tx

Pros:
- 30mins estimated flight
- extremely good glide slop

## FC Flight

## 3D CAD

Wing screw-in hole spacing: 40mm long, 30mm wide

1/13/2026 -- 730g fully-loaded
1/27/2026 -- 775g fully-loaded, no rear fairing

### WEBSITE TODO
- [ ] add mockingbird videos to website
- [ ] add corvus flight footage to website
- [ ] update docs and information on website

### Engineering Docs
- [ ] interface control document
- [ ] power budget
- [ ] mass growth allowance
- [ ] TRL assessment
- [ ] iterate

# V1.0
- [ ] improved electronics stack with autonomy
- [ ] winglets and other performance enhancements
- [ ] assembly video
