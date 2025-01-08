#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()


= Введение <intro> // Название и ссылка на него 
Работа №8. Адаптивное управление линейным объектом по выходу на основе алгоритма адаптации с расширенной ошибкой.

== Цель работы
Освоение метода расширенной ошибки в задачах
адаптивного управления по выходу


== Методические рекомендации.
До начала работы студенты должны
ознакомиться с методом расширенной ошибки [7, 8, 20] и его применением
в задачах адаптивного управления линейными объектами. Работа основана
на результатах работы №7 и является ее логическим продолжением. 

== Теоретические сведения
Рассмотрим минимально-фазовую линейную модель объекта,
представленную в форме "вход-выход":
$
  y^((n)) + a_(n-1) y^((n-1)) + dots + a_0 y = b_m u^((m)) + dots + b_0 u
$ <eq:object>

Вместе с моделью рассмотрим динамические фильтры:
$
  dot(nu)_1 = Lambda nu_1 + e_(n-1) u
$

$
  dot(nu)_2 = Lambda nu_2 + e_(n-1) y
$
где $nu_1, nu_2 in bb(R)^(n-1)$ --- векторы состояния фильтров, $e_(n-1) = "col"(0,dots, 0, 1)$, $e_(n-1) in bb(r)^(n-1)$,
#math.equation(block: true, numbering: none)[
  $
  Lambda = mat(delim: "[",
    0, 1, 0, dots, 0;
    0, 0, 1, dots, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    0, 0, 0, dots, 1;
    -k_0, -k_1, -k_2, dots, -k_(n-2)
  )
  $
]

Матрица $Lambda$ имеет сопровождающий полином:
#math.equation(block: true, numbering: none)[
  $
  K(s) = s^(n-1) + k_(n-2) s^(n-2) + k_(n-3) s^(n-3) + dots + k_0
  $
]

Лемма (R. V. Monopoli, 1974) Существует постоянный вектор $Psi in bb(R)^(2 n -1)$
$
  y(t) = 1/(K_M (s)) [ Psi^T omega(t) + b_m u(t) ] + delta(t)
$ <eq:parameterized-model>
Где $omega^T = mat(delim: "[", v_1^T, v_2^T, y)$, $delta(t)$ -- экспоненциально затухающая функция, определяемая ненулевыми начальными условиями.

_Постановка задачи управления по выходу._ Рассмотрим задачу слежения выходной переменной $y$ за эталонным
сигналом $y_M$ , формируемым эталонной моделью вида:
$
  y_M (t) = k_0/(K_M (s)) [g(t)]
$ <eq:reference-model>

Цель управления:
$
  lim_(t -> oo) (y_M (t) - y (t)) = 0
$ <eq:control-goal>


Закон управления формируется в виде
$
  u = 1/hat(b)_m (hat(Psi)^T omega_p + k_0 g)
$ <eq:control-law-1>

Введем в рассмотрение сигнал расширенной ошибки:
$
  hat(epsilon) = epsilon - hat(Psi)^T overline(omega)_p + 1/(K_M (s)) [hat(Psi)^T omega_p]
$ <eq:augmented-error-1>
где $epsilon = y_M - y$, $omega_p = -omega$, $overline(omega)_p = 1/(K_M (s))[omega_p]$.

Тогда с учетом (8.1) (см. методическое пособие) последнее равенство примет
следующий вид:
$
  hat(epsilon) = tilde(Psi)^T overline(omega)_p
$

Последнее выражение представляет собой статическую модель ошибки, на
базе которой строится алгоритм адаптации
$
  dot(hat(Psi)) = gamma Gamma overline(omega)_p/(1 + overline(omega)_p^T overline(omega)_p) hat(epsilon)
$ <eq:adaptation-law-1>
где:
$
  Gamma = cases(
    I_(2n) "если" hat(b)_m(t) >= b_("min"),
    I_(2n) - xi_(2n) xi_(2n)^T "если" hat(b)_m(t) < b_("min")
  )
$

// Введем в рассмотрение сигнал расширенной ошибки:
// $
//   hat(epsilon) = epsilon + hat(k) xi
// $ <eq:augmented-error-2>
// где $epsilon = y_M - y$, $omega^T = mat(delim: "[", v_1^T, v_2^T, y, g)$, $overline(omega) = 1/(K_M (s))[omega]$, $xi = 1/(K_M (s))[hat(Psi)^T omega] - hat(Psi)^T overline(omega) $

// Алгоритм адаптации примет следующий вид:
// $
//   dot(hat(Psi)) = gamma_1 overline(omega)_p/(1 + overline(omega)_p^T overline(omega)_p) hat(epsilon), quad dot(hat(k)) = gamma_2 xi/(1 + overline(omega)_p^T overline(omega)_p) hat(epsilon)
// $ <eq:adaptation-law-2>
