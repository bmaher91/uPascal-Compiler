BR L0
L1:
ADD SP #2 SP
PUSH #4
POP 4(D1)
PUSH 1(D1)
PUSH #3
CMPGTS
BRFS L2
PUSH #"DONE"
WRTS
BR L3
L2:
PUSH D1
PUSH 1(D1)
PUSH #1
ADDS
SUB SP #2 D1
CALL L1
SUB SP #1 SP
POP D1
L3:
PUSH 4(D1)
WRTS
SUB SP #2 SP
RET
L4:
ADD SP #0 SP
PUSH #"Hi"
WRTS
SUB SP #0 SP
RET
L0:
PUSH D0
ADD SP #4 SP
SUB SP #5 D0
PUSH #0
POP 1(D0)
PUSH #2
POP 2(D0)
PUSH D1
PUSH 1(D0)
SUB SP #2 D1
CALL L1
SUB SP #1 SP
POP D1
PUSH D1
SUB SP #1 D1
CALL L4
SUB SP #0 SP
POP D1
SUB SP #4 SP
POP D0
HLT
