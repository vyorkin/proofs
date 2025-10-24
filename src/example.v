(*|
=============================================
Доказываем всё, что по кайфу.
=============================================

:Author: Vasiliy Yorkin
:Date: October 24, 2025

|*)



(*| Попробуем поработать с finset.
Хрен его знает с чего начать. |*)
From mathcomp Require Import ssreflect ssrbool finset.

Module Finsets.

Open Scope set_scope.

Locate orbF.

(*| Для примера, докажем, что :math:`A \cup \emptyset = A`: 

 Здесь:

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
