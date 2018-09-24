mod VENDING-MACHINE is
  sorts Coin Item State .
  subsorts Coin Item < State .
  op __ : State State -> State [assoc comm id: null] .
  op null : -> State .
  op $ : -> Coin [format (r! o)] .
  op q : -> Coin [format (r! o)] .
  op tea : -> Item [format (b! o)] .
  op coffee : -> Item [format (b! o)] .

  rl $ => coffee .
  rl $ => tea q .
  eq q q q q = $ .
endm

red $ .

---q
