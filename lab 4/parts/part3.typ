#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Провести моделирование адаптивной системы управления с регулятором и алгоритмом адаптации.
Провести моделирование адаптивной системы управления с регулятором @eq:adaptive-regulator и алгоритмом адаптации @eq:adaptive-algorithm.
#math.equation(block: true, numbering: none)[
  $ u = hat(theta)^T x + 1/kappa g. $ 
]

#math.equation(block: true, numbering: none)[
  $ dot(hat(theta)) = gamma x b^T P e, quad hat(theta)(0)=0 $ 
]

 В ходе моделирования проиллюстрировать свойства 1-4 алгоритма управления. Для этого
необходимо:
1. Повторить три эксперимента п.п. 2 для фиксированного значения $gamma$;

Выбираем:
#math.equation(block: true, numbering: none)[
  $ gamma=10 \ $

  $ Q = mat(
    delim: "[", 
    1, 0; 
    0, 3
  ) \ $

  $ A_M^T P + P A_M + Q = 0 => P = mat(
    delim: "[", 
    7.9141,    0.0093;
    0.0093,    0.1457;
  ) $
]

a. Использовать расчетные значения параметров объекта, заложенные в $theta_1$ и $theta_2$
#figure(
  image("../matlab/images/task_3_1_1_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_1_1_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_1_1_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)


b. Незначительно отклонить параметры объекта так, чтобы система не потеряла устойчивость
#math.equation(block: true, numbering: none)[
  $ A := A + mat(delim: "[", 0, 0; 3, 3) $
]

#figure(
  image("../matlab/images/task_3_1_2_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_1_2_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_1_2_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
) 

c. Отклонить параметры объекта так, чтобы система потеряла устойчивость
#math.equation(block: true, numbering: none)[
  $ A := A + mat(delim: "[", 0, 0; 20, 20) $
]

#figure(
  image("../matlab/images/task_3_1_3_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_1_3_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_1_3_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)

*Выводы:* Мы видели система устойчивость когда параметры объекта отклонит
значительно значение. Это доказывает что система с адаптивным управлением
может адаптацироваться с изменением параметры объекта системы.

2. Используя расчетные значения параметров объекта, провести эксперимент с тремя различными значениями $gamma$

a. При $gamma=1$
#figure(
  image("../matlab/images/task_3_2_1_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_2_1_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_2_1_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)

b. При $gamma=20$
#figure(
  image("../matlab/images/task_3_2_2_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_2_2_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_2_2_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)

c. При $gamma=100$
#figure(
  image("../matlab/images/task_3_2_3_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_2_3_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_2_3_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)

*Выводы:* Коэффициент адаптации γ определяет скорость, с которой адаптивный
регулятор настраивается на новые параметры системы. Чем выше значение γ, тем
быстрее регулятор будет настраиваться. Однако, если значение γ слишком
высокое, регулятор может стать нестабильным.

3. Провести один из предыдущих экспериментов пункта при $g(t) =1$.

Выбираем эксперимент с $gamma=100$ и $g(t) =1$.
#figure(
  image("../matlab/images/task_3_3_x.png", width: 80%),
  caption: [Траектории $x(t)$ и $x_M (t)$]
)

#figure(
  image("../matlab/images/task_3_3_e.png", width: 80%),
  caption: [Ошибка управления $e(t)$]
)

#figure(
  image("../matlab/images/task_3_3_theta_tilde.png", width: 80%),
  caption: [Параметрическая ошибка $tilde(theta)(t)$]
)

*Выводы:* Мы видим что если входный сигнал системы это число, то система будет
адаптироваться к этому числу.