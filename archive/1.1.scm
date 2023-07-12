;;;SICP Chapter 1 Exercise 1
;;;Give the outputs of the given inputs.

10 -> 10
(+ 5 3 4) -> 12
(- 9 1) -> 8
(/ 6 2) -> 3
(+ (* 2 4) (- 4 6)) -> 6
(define a 3) -> <implementation defined>
(define b (+ a 1) -> <implementation defined>
(+ a b (* a b)) -> 19
(= a b) -> #f
(if (and (> b a)(< b (* a b)))
    b
    a) -> 4
<mess> -> 16
(+ 2 (if (> b a) b a)) -> 6
(* b (+ a 1)) -> 16
