#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

= Порядок выполнения работы <ch1>

#math.equation(block: true, numbering: none)[
  $
  a_0 = 6, quad a_1 = 7, quad b_0 = 6\
  k_(M 1) = 2, quad k_(M 2) = 1, quad k_(0) = 3\
  g(t) = 3 "sign"(sin(0.5 t))
  $
]

#include "part1.typ"
#include "part2.typ"
// #include "part3.typ"