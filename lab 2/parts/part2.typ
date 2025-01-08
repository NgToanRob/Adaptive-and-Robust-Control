#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Построение СУ с алгоритмом статической обратной связи <ch2:sec1>
Заменить алгоритм адаптации (1.9) на статическую обратную связь
(2.4) и провести эксперимент для трех различных значений коэффициента
и отличного от нуля сигнала задания $g(t)$ из Таблицы @tb:variant. Определить
влияние этого коэффициента на свойства системы. По результатам 
моделирования для каждого
$gamma$
построить два графика. На первом вывести $x(t)$ и $x_m (t)$, на втором --- $u$ .

Нелинейная статическая обратная связь:
#math.equation(block: true, numbering: none)[
  $
  hat(theta) = - gamma x epsilon
  $
]

Адаптипвный закон управления:
#math.equation(block: true, numbering: none)[
  $
  u = gamma x^2 epsilon - lambda x + lambda g
  $
]

Прм $gamma=1$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_x_gamma_1.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m (t)$.]
    )],[
    #figure(
      image("../matlab/images/task_2_u_gamma_1.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

Прм $gamma=10$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_x_gamma_10.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m (t)$.]
    )],[
    #figure(
      image("../matlab/images/task_2_u_gamma_10.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

Прм $gamma=30$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_x_gamma_30.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m (t)$.]
    )],[
    #figure(
      image("../matlab/images/task_2_u_gamma_30.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

Прм $gamma=31$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_x_gamma_31.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m (t)$.]
    )],[
    #figure(
      image("../matlab/images/task_2_u_gamma_31.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

