# Order 20 FIR low pass filter

## Description
A FIR filter of order N have the basic equation of:
$$y(n) = b_0x(n) + b_1x(n-1) + b_2x(n-2) + ... b_ix(n-i) + ... + b_Nx(n-N)$$

Compared to the IIR filter which is an analogue filter implemented in digital domain by sampling, the purely digital FIR filter have several advantages like requiring no feedback or being more stable. However, to get the same sharpness in magnitude
 response, a FIR filter requires more computational power (higher order) than an IIR filter. This particular filter is implemented using the filter design tool from MATLAB.

Amplitude response of the implemented filter in MATLAB:
![mag_res](https://user-images.githubusercontent.com/30526837/210131529-f4210644-6a60-4a78-b894-23557f6c70ff.png)
## Author
[@Minhkhoa444](https://github.com/Minhkhoa444)

## Version History
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets:
* [Whitney Knitte-DSP for FPGA: Simple FIR Filter in Verilog](https://www.hackster.io/whitney-knitter/dsp-for-fpga-simple-fir-filter-in-verilog-91208d)
* [RF Wireless World-Low Pass FIR Filter verilog code](https://www.rfwireless-world.com/source-code/VERILOG/Low-pass-FIR-filter-verilog-code.html)
