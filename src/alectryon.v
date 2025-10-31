(*|
=============================================
Играемся с alectryon.
=============================================

:Автор: Вася 
:Дата: 27 октября 2025 г.
:Погода: Дождливая, хуёвая
|*)

(*| Изучим эту штуковину, потыкаем флажки.
Используем пример с доказательством двойного отрицания как *подопытного кролика*. |*)


(*| 
.. important:: Сразу замечу. 
   Whatever

   Что работают тут далеко не все директивы_.

Но ссылки пиздец удобные.

|*)

Section Classical. (* .none *)

  Context (excl: forall A, A \/ ~ A ).
  Goal forall A, (~ ~ A -> A).
    intros A notnot_A.
    Show Proof. (* .messages .unfold *)
    destruct (excl A) as [a | na].
    - assumption.
      Show Proof. (* .messages .unfold *)
    - (* .none *)
  Abort.

End Classical. (* .none *)

(*| Поиграемся со следующими примерами из пейпера alectryon. |*)

Section Booleans. (* .none *)
(*|

Booleans
========

The built-in :coqid:`Boolean <Coq.Init.Datatypes.bool>`
type has two constructors: |*)
  Print bool. (* .unfold .no-in *)
  (*|
.. topic:: Induction principles
   Coq automatically defines an induction principle: |*)
Search (forall b: bool, _ b) "_ind". (* .unfold *)

End Booleans. (* .none *)

(*|
=============================
Writing decision procedures
=============================

Here's an inductive type:
|*)

Inductive Even : nat -> Prop :=
| EvenO : Even O
| EvenS : forall n, Even n -> Even (S (S n)).

(*|
.. note::
   А это какая-то заметка.

   Например, про то, что у нашего идуктивного типа есть 2 конструктора:
|*)

Check EvenO.
Check EvenS.

(*|
Тут можно просто формулы какие-то ебашить.

Вот так, например:

.. math::

   (a + b)^2 = a^2 + 2ab + b^2

   (a - b)^2 = a^2 - 2ab + b^2

Или вот так, чтобы были выровненные по знаку `&`, а разделены `\\`:

.. math::

   (a + b)^2  &=  (a + b)(a + b) \\
              &=  a^2 + 2ab + b^2

.. math::

 a &= (x + y)^2         &  b &= (x - y)^2 \\
   &= x^2 + 2xy + y^2   &    &= x^2 - 2xy + y^2

Если надо просто в одну строку, то нет проблем: :math:`(a + b)^2 = a^2 + 2ab + b^2`.

Ещё примерчик со слегка ёбнутым выравниванием:

.. math::

   y    & = & ax^2 + bx + c \\
   f(x) & = & x^2 + 2xy + y^2

|*)

(*|
А ещё можно форматировать в Latex по-умолчанию.

Для этого нужно написать если написать `.. default-role:: math` и
всё что после этого можно писать просто внутри апострофов, без префикса `:math:`.

Ну короче, вот, например, так:

.. default-role:: math

`\psi(r) = \exp(-2r)`

И нихуя себе - это работает.
|*)

(*| А ещё можно давать имена, и потом на них ссылаться.

.. math::
   :name: Fourier transform

   (\mathcal{F}f)(y)
    = \frac{1}{\sqrt{2\pi}^{\ n}}
      \int_{\mathbb{R}^n} f(x)\,
      e^{-\mathrm{i} y \cdot x} \,\mathrm{d} x.

|*)

(*|


.. math::
  \left.
    \begin{aligned}
      B' & = -\partial\times E,         \\
      E' & = \partial\times B - 4\pi j,
    \end{aligned}
  \right\}
  \qquad \text{Maxwell’s equations}

Вот это угарно: `\mathfrak{a+b}`. Типа готические символы.

А для всяких приколов типа числовых множеств, можно вот так делать: `\mathbb{R \subset C}`.

Корни:

`\sqrt{x^2-1}`

В пиздатой рамочке:

`\boxed{\sqrt{x^2-1}}`

Охуеть!

`2^k-\binom{k}{1}2^{k-1}+\binom{k}{2}2^{k-2}`

Вообще, `вот тут <https://docutils.sourceforge.io/docs/ref/rst/mathematics.html>`_ много чего есть полезного. Будем сюда подсматривать.
|*)

(*|
.. exercise:: Тут какое-то название упражнения или задачи.
   :difficulty: 3

   А тут как-то описание задачи/упражнения.

   Например, зацени какие пиздатые матрицы:

   .. math::
     \left ( \begin{matrix} a & b \\ c & d \end{matrix}\right)
 |*)

(*|
.. admonition:: Заголовок.

   Тут что-то написано.
|*)



(*| Какой-то ещё один параграф. |*)

(*| 
.. attention:: Внимание тут требуется. 

   А вот тут можно посмотреть какие ещё бывают директивы_.  
   Заметь, что это ссылка на внешний ресурс.
|*)

(*|
Это заголовок
=============
А это подзаголовок
------------------

А это просто текст какой-то. Параграф обычный.

Сейчас будет список:

- Первый
- Второй
- Третий

А теперь будет пронумерованный список:

1. Раз
2. Два
3. Три

Определения
-----------

Собака
  Друг человека.
  Собака бывает **кусачей** только от **жизни собачей**.

|*)

(*|
.. hint::

   Python's `zipfile` module
      Documentation of Python's standard `zipfile` module.

   `GNU tar manual, Basic Tar Format <https://example.org>`_
      Documentation for tar archive files, including GNU tar extensions.
|*)

(*|
.. _директивы: https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html
|*)
