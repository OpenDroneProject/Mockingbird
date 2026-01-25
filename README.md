# OpenDrone

<img src="./images/MockingbirdRender.png" alt="Mockingbird Render" width="500">  

OpenDrone is my attempt at creating a cheap, modular, easy-to-build and easy-to-fly series fixed-wing FPV drones. 

As a total beginner, I am learning as I go and prioritizing simplicity at every step. I try to avoid complex/skilled construction tricks.

I am making drones in different "weight" categories, starting with the [Mockingbird](./Mockingbird/README.md).

The goal is to have a collection of simple and cheap open-source drone designs with flight characteristics that make them useful tools, and not just toys. Long flight times, large payloads, modularity, and field-repairability are all design goals. The goal is to allow small groups of people to mass produce SAR drones without needing a whole lot of initial investment. A single maker or tinkerer should be able to assemble a small fleet of drones in their garage with a 3D printer, some hand tools, and [Made in China](https://evcraft.en.made-in-china.com) account.

## Educational Resources  

You can assemble one of these drones just by blindly following the build guide, but I also want to educate the end-user to enable them to modify and make their own drones. When I started this project, I had no knowledge of CAD, airplane design, or RC systems. I am still a novice, but I have the fundamentals down to build my own planes.

This list is by no means comprehensive, it is just the resources that *I* used. Feel free to open a pull request if you have suggestions. No higher education is needed to understand anything in this guide, just basic algebra and high school physics.

### Legal Stuff

Boring legal shit. Don't do anything illegal, please be respectful of others and their property. Don't get yourself in trouble.

#### AMA

The [Academy of Model Aeronautics](https://www.modelaircraft.org/) is a great resource. For about $90 a year you get $2.5M of liability insurance. Many clubs won't let you fly without a membership. They have a tool [here](https://www.modelaircraft.org/club-finder) for finding clubs and airfields near you.

#### FAA

The [FAA Rules](https://www.faa.gov/uas/recreational_flyers) has a lot of rules about flying drones. If you fly at a club, they will let you know all of the rules.

### Learning to Fly

Your local hobbyist club will hopefully be eager to teach you. I learned to fly on an HobbyZone Aeroscout in a few sessions. RealFlight is a simulator that costs about $90 and I have heard very good things about it, but have never tried it. For quad FPV, I recommend Liftoff simulator and a cheap [fpv sim controller](https://www.amazon.com/LiteRadio-Simulator-Controller-Platforms-Uncrashed-VelociDrone/dp/B0FMFCTSXV?crid=163UINBEK6QS6&dib=eyJ2IjoiMSJ9.xnhWYSquxKJj5OL3U9EsmF1q0HeqtO1HDr3DLXS6Tew3-k0hpkMFoyfnXiUqQexwXeFvDwKUMKCd358YWLLpDK4Ai9aDbBGJdtHuJPmLaaRJom3D20H7-8lsSK5iRNpl1RDoM-ruQk2_iJRAa4P1b8JcxiGrJiscxeSBFVuKiGfziRi3yADQESpsMAxyKc8V_hyhWlNSDw1Slh0AHA3R9_psteWJcnpMHg1TlBDfzRTYJQbJiY8eM4gU97aQnktUGLLYqbCfY-3ZiYayzX4UlsL0-hBjwGmbi0oddWdzAKI.j2J6rILeWqAvbk9kZLgWaOHOsAXvXN1cKWj002XkrjQ&dib_tag=se&keywords=betafpv+sim+controller&qid=1767541859&sprefix=betafpv+sim+controlle%2Caps%2C150&sr=8-6) or something like the [Radiomaster Pocket](https://www.amazon.com/Radiomaster-Pocket-Transmitter-Lightweight-ELRS-Charcoal/dp/B0DXPLH726?crid=RU2N277D3O1F&dib=eyJ2IjoiMSJ9.4IQZ2hm26cVN2f4lhVSDnH5o8VW3NRYoFH4lfSTh-BRx5w2g_HtfL_vHn27TPRWLFPsSfVtqrmwBUpiZ2BqAWAyLA4PMk8HzzfPDfVXjLC8MqPRSG3dTsG5e2pL6_KW8ms88TOWohy70KqKx1yx-hcgU63rqhtQvQCpDpZbB9oS05IBDfxJDMOL_RWxEEM-7b5r8Oq_ZtwpZa6i36gDeYwc-U7mpjoSLN9GSC-24gElkU2fbo1VaqDJJUU-CDACiXiHHoXdhf93SxOO7GzfRVPlbZvAROgaEw9SsU4V92fo.ODFQynP9_C1aGEEP5ErPtSMvKJHSH-zFDqgqDvqQUJE&dib_tag=se&keywords=radiomaster+pocket&qid=1767541896&sprefix=radiomaste%2Caps%2C179&sr=8-6) if you are willing to spend more money for a real controller.

### CAD Basics  

I use FreeCAD because this project should be accessible to as many people as possible. While other CAD programs are older, have more features, and are easier to use, but FOSS is under the control of the people. Not corporations or governments. For this reason, this guide is 100% FOSS.

[MangoJelly FreeCAD Tutorials](https://www.youtube.com/playlist?list=PLWuyJLVUNtc3UYXXfSglVpfWdX31F-e5S)  

The MangoJelly tutorials are incredible. He covers all of the fundamental skills needed to make parts in FreeCAD.  
(Total time to follow along with playlist, 24-48 hrs)  

[More FreeCAD Tutorials](https://youtube.com/playlist?list=PL10-2AjHWnW4To6a0luIpGCgNKQrAo04l&si=9Q5ZE8DqiylH0JF-)  

Here are more tutorials, with a guide on making a Lego minifigure based off of observation and measurements. These tutorials are excellent for thinking about how to replicate parts. Some of the first parts I designed were custom Lego accessories. (Total time to follow along with playlist, 10-20 hrs)

### Plastic Manufacturing Basics  

#### Plastic Part Design

It is easier to design good plastic parts if you understand the fundamentals of plastics and plastic design. The book [Designing Plastic Parts for Assembly](https://www.amazon.com/Designing-Plastic-Parts-Assembly-8E/dp/1569906688) is specifically about injection molding, but concepts like wall thickness, ribs, and filleting are applicable to 3D printed part design. I would recommend using the site [Anna's Archive](https://annas-archive.org/) to find a free copy of this book. It is very dense with a lot of information, so just read the first few chapters casually to understand the basics.

[Functional Design for 3D Printing](https://www.amazon.com/Functional-Design-Printing-2nd-Designing/dp/1511572027) is also a good resource.


#### 3D Printing

Personally I have a Bambu Labs A1 mini printer. It works extremely well out of the box with PLA and PETG filaments. For more pesky filaments like LW-PLA or TPU, you will need to play around with the settings to get things to work.

[Orca Slicer](https://orca-slicer.com/) is a fork of Bambu Studio with some added features. It is what I use for slicing my prints.

A video on [3D printing basics](https://www.youtube.com/watch?v=2vFdwz4U1VQ).  
[3D printing quality guide](https://www.youtube.com/watch?v=YPAXeBuq9qU)  

Here are some excellent videos on making snap-fit parts and making parts stronger:  
[Connecting Parts](https://www.youtube.com/watch?v=djm5tCFn9S0)  
[Part Strength](https://www.youtube.com/watch?v=Lq-SoGgKOcQ)  

### Aeronautical Engineering Basics

#### Forces of Flight

[A video on the Four Forces of Flight](https://www.youtube.com/watch?v=zKSNudPl9UI)  

#### Lift

[Principles of Flight (Lift)](https://www.youtube.com/watch?v=38X7UfPSdss)  
[Lift and Angle of Attack](https://www.youtube.com/watch?v=40uhfWbZH6g)  

#### Drag

Drag is a single force with multiple components. Parasitic Drag (consisting of skin friction drag and form drag), and Lift-Induced Drag (caused by turbulent airflow in the wake of the plane).

[Components of Drag](https://en.wikipedia.org/wiki/Drag_(physics))  
[Principles of Flight (Induced Drag)](https://www.youtube.com/watch?v=ohEiPg1q0TE)  
[Principles of Flight (Parasite Drag)](https://www.youtube.com/watch?v=V8vwyzt54_c)  

#### Tools

[Static Thrust Calculator](https://rcplanes.online/calc_thrust.htm)    
[ecalc](https://www.ecalc.ch/) prop sizing, performance estimation, much more.    

#### Airfoil Design

Airfoil design can get pretty complicated. I read a lot and ended up going with a simple Armin Wing, due to the fact that it would be nearly impossible for me to experimentally test a wing design without a wind tunnel or accurate cross-sectional measurements. However, wing design concepts are still good for understanding the basics of things like MAC and wing loading.
[Wing Design basics](https://www.youtube.com/watch?v=QHNtD8ChRZU)

I recommend watching these videos and building the glider from the video. Building the glider gave me a great sense of intuition for designing stable aircraft.
[RC Plane Design Basics](https://www.youtube.com/watch?v=CXvHv2EXcF8)
[Foamboard Glider Design](https://www.youtube.com/watch?v=YzqS_NjTxps)

#### Balance and Stability

[Aircraft Stability Concepts](https://www.youtube.com/watch?v=BWx8m4G0nEc)  
[Aircraft Stability Practical](https://www.youtube.com/watch?v=2t6tT77QFW4)  
[Flitetest, positioning the Center of Gravity](https://www.flitetest.com/articles/where-should-an-rc-airplane-center-of-gravity-be)  

### RC Basics


[Express LRS](https://www.youtube.com/watch?v=N0ajKoef3qs)  
[RC Battery Basics](https://www.youtube.com/watch?v=D98e2lRe2O8)   
[Safe Battery Charging](https://www.youtube.com/watch?v=MeAlEUb_vgg)
[Brushless DC Motors Explained](https://www.youtube.com/watch?v=yiD5nCfmbV0)  
[Servos](https://www.youtube.com/watch?v=tHOH-bYjR4k)  
[Joshua Bardwell Soldering](https://www.youtube.com/watch?v=GoPT69y98pY)  
[MuteFPV Soldering](https://www.youtube.com/watch?v=czXJevPWIsA)  
[SpeedyBee F405 wing setup](https://www.youtube.com/watch?v=LW57cibsMxY)  

[Flite Test Tutorial Series](https://youtube.com/playlist?list=PL6IuSFWz4ktvupu_gxw1vn-sjBGOkJFHV&si=_ucsjRaIemd7ZCSS) 

If you want to get deeper into electronics concepts, I recommend [Practical Electronics for Inventors, Fourth Edition](https://www.amazon.com/Practical-Electronics-Inventors-Fourth-Scherz/dp/1259587541)

### Autonomy

TODO

### FPV

TODO

# TODO: 

- [ ] stuff $100
    - [x] XT60 cable kit
    - [x] SG09 servos
    - [x] Fast-printing PETG
    - [x] FPV solder practice board
    - [x] Arms for holding boards while soldering
    - [x] brass sponge
    - [x] silicone mat
    - [x] flat plate for printing
    - [x] shorter servo connectors
- [ ] fpv
    - [ ] Eachine ev800D goggles
    - [ ] EWRF TS5823 5.8GHz 40CH 600mW FPV TX and camera


https://www.amazon.com/TMH-Adapter-Connector-Silicone-Battery/dp/B0DNT2R5JN?crid=GE1HQHI5DQ26&dib=eyJ2IjoiMSJ9.QkjUOMjxdrHe1SdKVyT4Ee5wkSv-6bxGqpwcSa5lXhc_k8Bm9mVfd2ogFp9WQCLKgAHJruZKMgIB9E644XkXOxqsSJWanjDZ-VR-T2VKuG-f5NjtEgYZ9rCTcqJJsTaGwZ8ubF6_16Mc3yHVdR4G6QPbBetahlqHHZ78SM3PxLiPR9RBbkKSQNMFKDtPSFQPUdXt3tPbOGID-eITO1aT9c6mStOGzMz6arcvToWG-cZHEC3Jc_Ymy45f1Nc114tXh1rxaIwRobLZX-54cvW5nNiOrEkqTPx0dG7hy8T-SpM.oz-steHD5VU9-ygqB1GXpYMPOJd49lmvVhHDceAMDbk&dib_tag=se&keywords=IC3%2Bconnector&qid=1767397399&sprefix=ic3%2Bconnecto%2Caps%2C156&sr=8-24&th=1

# Further Reading
Aircraft Design a Conceptual Approach
Basics of Model Aircraft Design
