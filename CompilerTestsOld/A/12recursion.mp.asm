BR L0
L1:
ADD SP #0 SP
PUSH 1(D1)
PUSH #0
CMPEQS
BRFS L2
RD  @2(D1)
PUSH #1
POP -1(D1)
BR L3
L2:
PUSH 1(D1)
ADD SP #1 SP
PUSH D1
PUSH 1(D1)
PUSH #1
SUBS
PUSH 2(D1)
SUB SP #3 D1
CALL L1
SUB SP #2 SP
POP D1
MULS
POP -1(D1)
L3:
SUB SP #0 SP
RET
L0:
PUSH D0
ADD SP #2 SP
SUB SP #3 D0
RD 1(D0)
ADD SP #1 SP
PUSH D1
PUSH 1(D0)
PUSH D0
PUSH #2
ADDS
SUB SP #3 D1
CALL L1
SUB SP #2 SP
POP D1
WRTS
PUSH 2(D0)
WRTS
SUB SP #2 SP
POP D0
HLT
