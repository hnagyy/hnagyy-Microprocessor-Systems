;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 
		
            ORG   $3000
            
MULTIPLICAND    FCB  05
MULTIPLIER      FCB  02
PRODUCT         RMB   2


            ORG   $4000


Entry:
_Startup:
            LDAA  MULTIPLICAND ; Loading the first number into Accumulator A
            LDAB   MULTIPLIER ; Loading the second number into Accumulator B
            MUL               ; Multplying the numbers by eachother
            STAB PRODUCT ; and store the product
            SWI       ; break to the monitor


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
