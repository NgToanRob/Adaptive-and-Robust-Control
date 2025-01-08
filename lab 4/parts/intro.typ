#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()


= Введение <intro> // Название и ссылка на него 
Работа №6. Синтез адаптивного наблюдателя состояния многомерного объекта.

== Цель работы
Освоение принципов построения адаптивной системы
управления многомерным объектом.


== Методические рекомендации.
До начала работы студенты должны
ознакомиться с принципом параметризованного представления вектора
состояния линейного объекта (см. Работу №5) и с построением алгоритмов
адаптации на основе стандартных моделей ошибок [2, 13, 16, 20]. 

== Теоретические сведения
Дан асимптотически устойчивый объект управления:
#math.equation(block: true, numbering: none)[
  $
  cases(
    dot(x) &= A x + b u"," quad x(0)\
    y &= C x
  )
  $
]
где $x$ --- недоступный прямому измерению вектор состояния объекта, $y$ --- вектор выхода объекта, $u$ --- вектор управляющего воздействия, $A$ --- матрица системы, $b$ --- матрица управления, $C$ --- матрица выхода.
#math.equation(block: true, numbering: none)[
  $
  A = mat(delim: "[",
    -a_(n-1), 1, dots.c, 0;
    -a_(n-2), 0, dots.c, 0;
    dots.v, dots.v, dots.down, 1;
    -a_0, 0, dots.c, 0
  ), quad
  b = mat(delim: "[",
    0;
    dots.v;
    0;
    b_m;
    dots.v;
    b_0
  ), quad
  C = mat(delim: "[",
    1, 0, dots.c, 0
  )
  $
]
$a_i, i = overline(0","n-1)$, $b_j, j=overline(m","0)$ неизвестные коэффициенты модели.


Рассматриваемая задача состоит в построении оценки вектора состояния $hat(x)$ такой, что:
#math.equation(block: true, numbering: none)[
  $
  lim_(t -> oo) (x(t) - hat(x)(t)) = 0
  $
]

Нам надо знать некоторые формы:
#math.equation(block: true, numbering: none)[
  $
  theta = mat(
    delim: "[",
    k_0 - b_0;
    k_1 - b_1;
    dots.v;
    k_(n-1) - a_(n-1);
    b_0;
    b_1;
    dots.v;
    b_m
  ), quad
  omega = mat(
    delim: "[",
    1/(K(s)) [y];
    s/(K(s)) [y];
    dots.v;
    s^(n-1)/(K(s)) [y];
    s/(K(s)) [u];
    dots.v;
    s^m/(K(s)) [u]
  )
  $
]

Решение задачи. Для решения задачи используется параметризованное представление выходной переменной:
#math.equation(block: true, numbering: none)[
  $
  hat(y) = hat(theta)^T omega
  $
]
$hat(y)$ --- ⎯ оценка переменной $y$. Введем в рассмотрение ошибку идентификации: 
#math.equation(block: true, numbering: none)[
  $
  e = y - hat(y) = tilde(theta)^T omega, quad tilde(theta) = theta - hat(theta)
  $
]

Алгоритм адаптации:
#math.equation(block: true, numbering: none)[
  $
  dot(hat(theta)) = gamma omega epsilon
  $
]

Оценка вектора состояния:
#math.equation(block: true, numbering: none)[
  $
  hat(x) = sum_(i=0)^(n-1) (s I - A_0)^(-1) e_(n-i) [y]
  + sum_(j=0)^(m) hat(theta)_(j+1+n) (s I - A_0)^(-1) e_(n-j) [u]
  $
]