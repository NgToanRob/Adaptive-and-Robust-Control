#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Построение эксперимента при $u(t) = 10 sin(t) + 5 cos(2t) + 4 cos(4t) + 3 cos(8t)$ <ch2:sec1>

Путем многократных экспериментов в Simulink, мы выбрали $gamma = 0.5$

Построение двух графиков моделирования. На первом отобразить переменные состояния
норму разности $|| x(t) - hat(x)(t) ||$ . На втором графике --- параметрические
ошибки $tilde(theta)$

#figure(
  image("../matlab/images/task2_2_norm.png", width: 90%),
  caption: [График нормы разности $||x(t) - hat(x)(t)||$]
)

#figure(
  image("../matlab/images/task2_theta_tilde.png", width: 90%),
  caption: [График параметрических ошибок $tilde(theta)$]
)