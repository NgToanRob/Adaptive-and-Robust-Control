#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Построение адаптивной системы управления
На основе данных, приведенных в Таблице @tb:variant, провести
моделирование адаптивной системы управления, полученной в Работе №1, в условиях действия на объект возмущения вида [12]
#math.equation(block: true, numbering: none)[
  $
  delta(t) = (1+t)^(-1/8) [1- theta(1+t)^(-1/4) - 3/8 (1+t)^(-5/4)].
  $
]
При моделировании использовать следующие значения параметров: $gamma=0.25$, $x(0)=1$ и $hat(theta)(0)=1$. Сигнал задания $g(t)$ принять равным нулю. По результатам моделирования построить три графика. На первом вывести $x(t)$ и $x_m (t)$
, на втором --- $u(t)$, на третьем --- $tilde(theta)(t)=theta- hat(theta)(t)$. Время
моделирования выбрать 1000 с.

По заданию известны следующие параметры:
#figure(
  table(
  columns: 4,
  [Вар.], [Параметр объекта\ $theta$], [Параметр
эталонной\ модели\ $lambda$], [Сигнал\ задания\ $g(t)$],
  [13], [6], [4], [$"sign"(cos t) + 8$]
  ) ,
  caption: [Вариант заданий],
) <tb:variant>

Модель объекта управления:
#math.equation(block: true, numbering: none)[
  $
  dot(x) = theta x + u + delta
  $
]

Эталонная модель:
#math.equation(block: true, numbering: none)[
  $
  dot(x)_m = -lambda x_m + lambda g
  $
]

Адаптипвный закон управления:
#math.equation(block: true, numbering: none)[
  $
  u = - hat(theta) x - lambda x + lambda g
  $
]

Алгоритм адаптации:
#math.equation(block: true, numbering: none)[
  $
  dot(hat(theta)) = - gamma x epsilon
  $
]

#figure(
  image("../matlab/images/task_1_simulink.png", width: 90%),
  caption: "Структурная схема моделирования системы."
)

#figure(
  image("../matlab/images/task_1_x.png", width: 70%),
  caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m (t)$.]
)

#figure(
  image("../matlab/images/task_1_u.png", width: 70%),
  caption: [График изменения управляющего воздействия $u(t)$.]
)

#figure(
  image("../matlab/images/task_1_theta_e.png", width: 70%),
  caption: [График изменения ошибки $tilde(theta)(t)$.]
)
