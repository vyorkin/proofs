(*|
=============================
Доказываем всё, что по кайфу.
=============================

:Автор: Вася 
:Дата: 24 октября 2025 г.
:Погода: Облачность, пойдёт
|*)


(*| Попробуем поработать с finset. Хрен его знает с чего начать. |*)

From mathcomp Require Import ssreflect ssrbool fintype finset. (* .none *)

Module Finsets.

Open Scope set_scope.

Locate orbF.

(*| Для примера, докажем, что :math:`A \cup \emptyset = A`: 

 Здесь:

 * `{set T}` - `finset` из `mathcomp`
 * `:|:` - объединение множеств (union)
 * `set0` - пустое множество.

 * `setP` - :math:`A = B \iff \forall x, \, (x \in A \leftrightarrow x \in B)`:
 * `in_setU` - :math:`x \in A \cup B \iff x \in A \lor x \in B`: 
 * `in_set0` - :math:`x \in \emptyset \iff \mathrm{False}`: 
 * `orbF` - :math:`a \lor \mathrm{False} = a`:

|*)

Lemma union_set0 T (A : {set T}) : A :|: set0 = A.
Proof.
  apply/setP => x.
  rewrite in_setU.
  rewrite in_set0.
  rewrite orbF.
  done.
Qed.

End Finsets.
