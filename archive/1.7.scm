;; SICP 2nd Edition Chapter 1 Exercise 7
;; The good-enough? test used in computing square roots will not be very
;; effective for finding the roots of very small numbers. Also, in real
;; computers, arithmetic operations are almost always performed with
;; limited precision. This makes our test inadequate for very large
;; numbers. Explain these statements, with examples showing how the test
;; fails for small and large numbers. An alternative strategey for
;; implementing good-enough? is to watch how guess changes from one
;; iteration to the next and to stop when the change is a very small
;; fraction of the guess. Design a square-root procedure that uses this
;; kind of end test. Does this work better for small and large numbers?


;; Examples of failure:
;; 1 ]=> (square 0.000002)

;; ;Value: .000000000004

;; 1 ]=> (sqrt 0.0000000000004)

;; ;Value: .0312500000042625

;; 1 ]=> (square 999999999)

;; ;Value: 999999998000000001

;; 1 ]=> (sqrt 999999998000000001)

;; ;Value: 999999999.



(define (abs x) 
  (if (< x 0)
      (- x)
      x))

(define (square x) (* x x))

(define (sqrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess x)
      guess
      (sqrt-iter (improve guess x)
		 guess
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2.0))

;; 1.7
(define (good-enough? guess pre-guess x)
  (< (abs (/ (- guess pre-guess) x)) 0.00000000000000000001))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt .0004)


