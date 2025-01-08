#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Сформирование эталонной модели 
 На основе заданных в @tb:variant значений времени переходного
процесса $t_"п"$ и максимального перерегулирования $overline(sigma)$ сформировать
эталонную модель в форме @eq:reference-x, @eq:reference-y. Построить график переходной
функции модели, на котором показать время переходного процесса $t_"п"$ и
перерегулирование $overline(sigma)$


По заданию известны следующие параметры:
#figure(
  table(
  columns: 6,
  [Вар.], [Матрица\ $A$], [Коэфф.\ передачи\ $b_0$], [Время\ переходного\ процесса, $t_"п"$], [Максимальное\ перерегули\ -рование\ $overline(sigma), percent$], [Сигнал задания $g(t)$],
  [13], [#math.equation(block: true, numbering: none)[
    $ mat(delim: "[", 0, 1; -1, 5) $
    ]], [$4$], [$0,4$], [$<15$], [9$"sign"(sin(0.1t)) + 12$]
  ) ,
  caption: [Вариант заданий],
) <tb:variant>


Для системы второго порядка мы выбираем следующий полином Баттерворта.
#math.equation(block: true, numbering: none)[
  $ B(s)= s^2 + sqrt(2) omega s + omega^2 $
]

Предположим, мы выбираем 5% допуск и находим точку перехода
#figure(
  image("../matlab/images/butterworth.png", width: 80%),
)

Время переходного процесса: $t_"п" = 0.4$


Частота среза: 
#let t_inj = 2.93
#let t = 0.4
#let omega_c = t_inj / t
#math.equation(block: true, numbering: none)[
  
  $ omega = t_"п"^* / t_"п" = #t_inj / #t = #omega_c  \
    arrow.r B(s) = s^2 + sqrt(2) * #omega_c * s + #omega_c^2 \
    arrow.r B(s) = s^2 + 10.359 s + 53.656
  $
]

Получаем эталонную модель:
#math.equation(block: true, numbering: none)[
  $
  cases(
    dot(x)_M &= A_M x_M + b_M g,
    y_M &= C_M x_M
  )
  $
]
где: $A_M = mat(delim: "[", 0,1 ; -53.656, -10.359)$, $b_M = mat(delim: "[", 0; 53.656)$, $C_M = mat(delim: "[", 1, 0)$


График переходной функции модели:
#figure(
  image("../matlab/images/step_response.png", width: 90%),
)

На основе метода стандартных характеристических полиномов сформируем
эталонную модель. На графике видно показано время переходного процесса $t_"п"=0.4$ и максимальное перерегулирование $overline(sigma) = (0.0194 - 0.0186)/0.0186 approx 4.3 percent < 15%$.
