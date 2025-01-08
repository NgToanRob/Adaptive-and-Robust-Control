#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Задание 1
На основе фильтров (7.2), (7.3), настраиваемого регулятора (7.8),
алгоритма адаптации (8.4), расширенной ошибки (8.2) и данных,
представленных в Таблице 8.1, построить стабилизирующее адаптивное
управление ($g = 0$). Начальное условие в алгоритме адаптации (8.4)
$hat(b)_m(0)=1$. Согласно вариантам заданий $m=1$, $hat(b)_m equiv hat(b)_1$, $b_m equiv b_1$.

Провести моделирование для трех различных коэффициентов $gamma$. По
результатам моделирования построить три графика. На первом графике
отобразить выходную переменную $y$, на втором графике  управляющее
воздействие $u$, на третьем $gamma$ оценки параметров $hat(Psi)_p$.

#figure(
  image("../matlab/images/modeling.png", width: 100%),
  caption: [График моделирования]
)

Результаты эксперимента:
- При $gamma = 1$:
#figure(
  image("../matlab/images/task_1_gamma_1_y.png", width: 90%),
  caption: [График выходной переменной $y$ при $gamma = 1$]
)

#figure(
  image("../matlab/images/task_1_gamma_1_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 1$]
)

#figure(
  image("../matlab/images/task_1_gamma_1_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 1$]
)

- При $gamma = 10$:
#figure(
  image("../matlab/images/task_1_gamma_10_y.png", width: 90%),
  caption: [График выходной переменной $y$ при $gamma = 10$]
)

#figure(
  image("../matlab/images/task_1_gamma_10_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 10$]
)

#figure(
  image("../matlab/images/task_1_gamma_10_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 10$]
)

#pagebreak()
- При $gamma = 100$:
#figure(
  image("../matlab/images/task_1_gamma_100_y.png", width: 90%),
  caption: [График выходной переменной $y$ при $gamma = 100$]
)

#figure(
  image("../matlab/images/task_1_gamma_100_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 100$]
)

#figure(
  image("../matlab/images/task_1_gamma_100_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 100$]
)

