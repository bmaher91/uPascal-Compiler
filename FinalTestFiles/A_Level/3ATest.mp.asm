BR L0
L1:
ADD SP #1 SP
PUSH #"Please enter an integer"
WRTS
PUSH #""
WRTLNS
RD 4(D1)
PUSH #"The value "
WRTS
PUSH 4(D1)
PUSH 1(D1)
MODS
PUSH 2(D1)
SUB SP #1 SP
CASTSF
ADD SP #1 SP
MULSF
WRTS
PUSH #" should be returned"
WRTS
PUSH #""
WRTLNS
PUSH 4(D1)
PUSH 1(D1)
MODS
PUSH 2(D1)
SUB SP #1 SP
CASTSF
ADD SP #1 SP
MULSF
CASTSI
POP -1(D1)
SUB SP #1 SP
RET
L2:
ADD SP #6 SP
PUSH 1(D1)
PUSH #2
MULS
POP -1(D1)
SUB SP #6 SP
RET
L0:
PUSH D0
ADD SP #3 SP
SUB SP #4 D0
PUSH #"This is test 4 of A level"
WRTS
PUSH #""
WRTLNS
PUSH #"This will test function calling and return values"
WRTS
PUSH #""
WRTLNS
PUSH #"Please enter two floats"
WRTS
PUSH #""
WRTLNS
RDF 1(D0)
RDF 2(D0)
ADD SP #1 SP
PUSH D1
PUSH #123
PUSH 2(D0)
SUB SP #3 D1
CALL L1
SUB SP #2 SP
POP D1
CASTSF
POP 3(D0)
PUSH #"The value "
WRTS
PUSH 3(D0)
WRTS
PUSH #" was returned\n"
WRTS
PUSH #""
WRTLNS
PUSH #"The value "
WRTS
ADD SP #1 SP
PUSH D1
PUSH #123
PUSH 1(D0)
SUB SP #3 D1
CALL L1
SUB SP #2 SP
POP D1
WRTS
PUSH #" was returned\n"
WRTS
PUSH #""
WRTLNS
PUSH #"The value "
WRTS
ADD SP #1 SP
PUSH D1
ADD SP #1 SP
PUSH D1
PUSH #11
SUB SP #2 D1
CALL L2
SUB SP #1 SP
POP D1
PUSH #5.0
SUB SP #3 D1
CALL L1
SUB SP #2 SP
POP D1
WRTS
PUSH #" was returned\n"
WRTS
PUSH #""
WRTLNS
SUB SP #3 SP
POP D0
HLT
