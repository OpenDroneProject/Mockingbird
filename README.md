# MockingBird

<img src="./images/MockingbirdRender.png" alt="Mockingbird Render" width="500">    
<img src="./images/construction/A20.jpg" alt="Mockingbird Prototype" width="500">  

Mockingbird is intended to be the cheapest and simplest drone to make. Here are some stats:

- $90 cost per unit (not counting autonomy or FPV)
- Printable on a Bambu A1 Mini
- 745g (not counting autonomy or FPV)
- 1680g Static Thrust
- ~8 hours to build (most of that is 3D printer time)
- Adjustable Center of Lift
- Modular design, swap out the wings, tailfin, motor, battery, receiver, etc.

More detailed specs available on the [specs page](./SPECS.md).


[Bill of Materials](./BILL_OF_MATERIALS.md)  
[Assembly Guide](./ASSEMBLY.md)  
[Electronics Setup](./ELECTRONICS_SETUP.md)  

## Making the PDF
The `build_book.sh` script is a utility that turns the markdown files in this repo into a PDF.

If rust is not installed run `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

```bash
cargo install mdbook
./build_book.sh
mdbook serve book/
```

Download the webpage as a PDF, or run:
```bash
cargo install mdbook-pdf                                                      
mdbook-pdf book/
```

This file is large (~500MB), and will not be stored in this repository.