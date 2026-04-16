# TODO

- [x] test VTX
- [x] adjust camera
- [x] get motor working
- [x] Static plane test 
- [ ] cut battery
- [ ] fork and test external battery
- [ ] add holes for screw-mounted FC

- [ ] configure failsafe
- [ ] finish setting up inav
- [ ] land in safe zone

- [ ] make camera mount slightly smaller
- [ ] make camera mount not print PETG

### Documentation
- [ ] document assembly
    - [ ] update CAD BOM
- [ ] document electronics setup
    - [ ] electronics BOM
    - [ ] all parts
    - [ ] soldering
    - [ ] wiring
        - [ ] braided wires
    - [ ] flashing
    - [ ] setup
        - [ ] inav
        - [ ] edgetx
- [ ] wiring diagrams

VTX CONNECT TO SPEEDYBEE:
tx5 is smartaudio, vv is voltage+ for the vtx, and VTX is video
so as it is labelled, Vv = 7-26v input, GND = GND, TX5 = smart audio, and VTX = video
        
- [x] build brand-new drone from scratch (again)
- [ ] update assembly guide with rear fairing, updated CF rod assembly info, opposing servo positions, and updated pushrod configuration (mor authority)
- [ ] update electronics guide
    - [x] no FC
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