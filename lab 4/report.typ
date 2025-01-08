#import "lib.typ": *

// Определение шаблона 
#show: template.with(
  // Это может быть удалено, если не используется программный код:
  languages: (
    // rust: 
    //   (name: "Rust", 
    //   icon: icon(image("images/brand-rust.svg")), 
    //   color: rgb("#CE412B")),
    python: 
     (name: "Python",
     icon: icon(image("images/logo_itmo.png",width: 15%)),
     color: rgb("#3572A5"))
  ),
  type-of-work: [Отчет по лабораторной работе №4\
      по дисциплине\
      _"Адаптивное и робастное управление"_\
      #v(1em)
      по теме:\ 
      "СИНТЕЗ АДАПТИВНОГО\ НАБЛЮДАТЕЛЯ СОСТОЯНИЯ ЛИНЕЙНОГО ОБЪЕКТА"
      #v(1em)
      Вариант №13
  ],
  logo: image("./images/logo_itmo.png",width: 15%),
  author-first-name: "Тоан",
  author-last-name: "Нгуен",
  author-initials: "Т. Нгуен",
  co-author-first-name-1: "Нгуен",
  co-author-last-name-1: "Буй Динь Кхай",
  co-author-first-name-2: "Тан Куонг",
  co-author-last-name-2: "Хюинь",
  supervisor-last-name: "Козачёк",
  supervisor-first-name: "Ольга Андреевна"
)

// Основные части документа 
#show heading.where(level:1): set heading(numbering: "Глава 1.")
#include "./parts/intro.typ"
#include "./parts/content.typ"

// #include "./parts/part2.typ"  kl;k lkl
// #include "./parts/part3.typ"

// Выключить нумерацию выходных данных 
#show heading: set heading(numbering:none)

// Заключение 
#include "./parts/conclusion.typ"

// Выходные данные
// = Список сокращений и условных обозначений 
// #import "./common/acronyms.typ": acronyms-entries
// #import "./common/symbols.typ": symbols-entries
// #print-glossary(acronyms-entries+symbols-entries)

// = Словарь терминов 
// #import "./common/glossary.typ": glossary-entries
// #print-glossary(glossary-entries)

// #bibliography(title: "Список литературы", ("./common/external.bib","./common/author.bib"), style: "gost-r-705-2008-numeric")

#show outline: set heading(outlined: true)

#outline(title: "Список рисунков", target: figure.where(kind: image))

#outline(title: "Список таблиц", target: figure.where(kind: table))

// Приложения 
// #include "./parts/appendix.typ"