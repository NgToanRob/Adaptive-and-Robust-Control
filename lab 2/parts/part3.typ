#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Построение СУ с алгоритмом робастной $sigma$ модификации <ch3:sec1>

Заменить алгоритм адаптации (1.9) на робастную $sigma$ -- модификацию @eq:adaptive-algorithm-2. Повторить эксперимент для трех различных значений
коэффициента
$sigma$. Сигнал задания
$g(t)$
выбрать из Таблицы @tb:variant согласно
варианту. Определить влияние этого коэффициента на свойства системы.
По результатам моделирования для каждого
$sigma$
построить два графика.  На первом вывести $x(t)$ и $x_m(t)$, на втором --- $u$ .

Робастная $sigma$ -- модификация:
#math.equation(block: true, numbering: none)[
  $
  dot(hat(theta)) = - sigma hat(theta) - gamma x epsilon
  $
]

Адаптивный закон управления:
#math.equation(block: true, numbering: none)[
  $
  u = - hat(theta) x - lambda x + lambda g
  $
]
При $sigma=10$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_x_sigma_10.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )],[
    #figure(
      image("../matlab/images/task_3_u_sigma_10.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

При $sigma=1$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_x_sigma_1.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )],[
    #figure(
      image("../matlab/images/task_3_u_sigma_1.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)

При $sigma=0.1$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_x_sigma_0_1.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )],[
    #figure(
      image("../matlab/images/task_3_u_sigma_0_1.png", width: 95%),
      caption: [График изменения управляющего воздействия $u(t)$.]
    )
  ]
)