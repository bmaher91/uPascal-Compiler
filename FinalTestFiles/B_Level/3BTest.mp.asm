BR L0
L0:
PUSH D0
ADD SP #3 SP
SUB SP #4 D0
PUSH #"Test 4 of the B level"
WRTS
PUSH #""
WRTLNS
PUSH #"This will test more while looping\n"
WRTS
PUSH #""
WRTLNS
PUSH #"Please enter an integer"
WRTS
PUSH #""
WRTLNS
RD 1(D0)
PUSH 1(D0)
PUSH #5
SUBS
POP 2(D0)
L1:
PUSH 1(D0)
PUSH 2(D0)
CMPGTS
BRFS L2
PUSH 2(D0)
POP 3(D0)
L3:
PUSH 2(D0)
PUSH 1(D0)
CMPNES
BRFS L4
PUSH 2(D0)
WRTS
PUSH #", "
WRTS
PUSH 2(D0)
PUSH #1
ADDS
POP 2(D0)
BR L3
L4:
PUSH #""
WRTS
PUSH #""
WRTLNS
PUSH 3(D0)
POP 2(D0)
PUSH 1(D0)
PUSH #2.0
SUB SP #1 SP
CASTSF
ADD SP #1 SP
SUBSF
CASTSI
POP 1(D0)
BR L1
L2:
PUSH #"\nShould print the numbers from "
WRTS
PUSH 2(D0)
WRTS
PUSH #" to "
WRTS
PUSH 2(D0)
PUSH #4
ADDS
WRTS
PUSH #" then the first 3 of that list, then just "
WRTS
PUSH 2(D0)
WRTS
PUSH #""
WRTLNS
SUB SP #3 SP
POP D0
HLT
