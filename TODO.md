# TODO

### Revisons for FC stack
- [x] redesign pod to hold FC
- [x] design VTX mount
- [ ] design camera mount and add to PETG parts list
- [ ] redesign bottom fairing

### Software
- [x] Charge battery and plug into FC
- [x] Flash INAV and test IMU
- [x] Test VTX and camera
- [x] solder ELRS
- [ ] Test ELRS with servos
- [ ] Static plane test 

### Make New Plane
- [x] PETG parts
- [x] motor mount
- [x] servo fairings
- [ ] Pod (x2)
- [ ] VTX mount PETG (x2)

- [ ] front fairing
- [ ] Rear fairing
- [ ] bottom fairing

- [ ] Full step-by-step assembly guide
    - [x] electronics configuration guide
        - [ ] plugging everything in
        - [ ] fix EdgeTX diagrams in electronics, or add images
        - [ ] edge tX inverse mix

VTX CONNECT TO SPEEDYBEE:
tx5 is smartaudio, vv is voltage+ for the vtx, and VTX is video
so as it is labelled, Vv = 7-26v input, GND = GND, TX5 = smart audio, and VTX = video
        
- [ ] build brand-new drone from scratch (again)
- [ ] update assembly guide with rear fairing, aluminum tube, opposing servo positions, and updated pushrod configuration
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

## 3D CAD

Wing screw-in hole spacing: 40mm long, 30mm wide

1/13/2026 -- 730g fully-loaded
1/27/2026 -- 775g fully-loaded, no rear fairing

Estimated weight reduction from printing with OVERTURE PLA AIR, 30% per part.
Savings:
bottom fairing -- 10g
front fairing -- 6g
e payload -- 14g
total: 30g
new weight ~745g

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
- [ ] weight optimization
- [ ] improved electronics stack with autonomy
- [ ] winglets and other performance enhancements
- [ ] assembly video
