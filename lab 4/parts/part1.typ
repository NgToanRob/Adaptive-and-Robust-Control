#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Моделирование адаптивного наблюдателя состояния многомерного объекта при $u(t) = 10 sin(t)$

Наш Вариант 13

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    table.header(
      table.cell(colspan:4, [Коэффициенты передаточной функции\ объекта ($n = 2$)]),
      table.cell(colspan:2, [Коэффициенты фильтра]),
    ),
    [$a_1$], [$a_0$], [$b_1$], [$b_0$], [$k_1$], [$k_0$],
    [3], [3], [2], [7], [1.6], [0.64]
  ),
  caption: "Коэффициенты передаточной функции объекта и фильтра"
)

Путем многократных экспериментов в Simulink, мы выбрали $gamma = 0.5$

#figure(
  image("../matlab/images/adaptive_observer.png", width: 100%),
  caption: "Схема моделирования адаптивного наблюдателя состояния многомерного объекта"
)

построение двух графиков моделирования. На первом отобразить переменные состояния
норму разности $|| x(t) - hat(x)(t) ||$ . На втором графике --- параметрические
ошибки $tilde(theta)$

#figure(
  image("../matlab/images/task1_2_norm.png", width: 90%),
  caption: [График нормы разности $||x(t) - hat(x)(t)||$]
)

#figure(
  image("../matlab/images/task1_theta_tilde.png", width: 90%),
  caption: [График параметрических ошибок $tilde(theta)$]
)




