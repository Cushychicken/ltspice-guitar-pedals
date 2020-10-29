*//////////////////////////////////////////////////////////////////////
* (C) National Semiconductor, Inc.
* Models developed and under copyright by:
* National Semiconductor, Inc.  

*/////////////////////////////////////////////////////////////////////
* Legal Notice: This material is intended for free software support.
* The file may be copied, and distributed; however, reselling the 
*  material is illegal

*////////////////////////////////////////////////////////////////////
* For ordering or technical information on these models, contact:
* National Semiconductor's Customer Response Center
*                 7:00 A.M.--7:00 P.M.  U.S. Central Time
*                                (800) 272-9959
* For Applications support, contact the Internet address:
*  amps-apps@galaxy.nsc.com

* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\            
* LM13700 Dual Operational Transconductance Amplifier                 
* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\                 
*
*                   Amplifier Bias Input
*                   | Diode Bias
*                   | | Positive Input
*                   | | | Negative Input
*                   | | | | Output
*                   | | | | | Negative power supply
*                   | | | | | | Buffer Input
*                   | | | | | | | Buffer Output
*                   | | | | | | | | Positive power supply
*                   | | | | | | | | |
.SUBCKT LM13700/NS  1 2 3 4 5 6 7 8 11
*
* Features:
* gm adjustable over 6 decades.
* Excellent gm linearity.
* Linearizing diodes.
* Wide supply range of +/-2V to +/-22V.
*
* Note:  This model is single-pole in nature and over-estimates
*       AC bandwidth and phase margin (stability) by over 2X.   
*       Although refinement may be possible in the future, please
*       use benchtesting to finalize AC circuit design.
* 
* Note: Model is for single device only and simulated
*       supply current is 1/2 of total device current.
*
******************************************************
* 
C1  6  4  4.8P
C2  3  6  4.8P
* Output capacitor  
C3  5  6  6.26P                                       
D1  2  4  DX
D2  2  3  DX
D3  11 21 DX
D4  21 22 DX
D5  1  26 DX
D6  26 27 DX
D7  5  29 DX
D8  28 5  DX
D10 31 25 DX
* Clamp for -CMR  
D11 28 25 DX                                        
* Ios source 
F1  4  3  POLY(1)   V6 1E-10 5.129E-2 -1.189E4 1.123E9 
F2  11 5  V2        1.022
F3  25 6  V3        1.0
F4  5  6  V1        1.022
* Output impedance 
F5  5  0  POLY(2)   V3 V7 0 0 0 0 1                  
G1  0  33 5         0 .55E-3
I1  11 6  300U
Q1  24 32 31        QX1
Q2  23 3  31        QX2
Q3  11 7  30        QZ
Q4  11 30 8         QY
V1  22 24 0V
V2  22 23 0V
V3  27 6  0V
V4  11 29 1.4
V5  28 6  1.2
V6  4  32 0V
V7  33 0  0V
.MODEL QX1 NPN (IS=5E-16     BF=200 NE=1.15 ISE=.63E-16 IKF=1E-2)
.MODEL QX2 NPN (IS=5.125E-16 BF=200 NE=1.15 ISE=.63E-16 IKF=1E-2)
.MODEL QY  NPN (IS=6E-15     BF=50)
.MODEL QZ  NPN (IS=5E-16     BF=266)  
.MODEL DX  D   (IS=5E-16)
.ENDS
*$
