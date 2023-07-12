;; SICP 2nd Edition Chapter 1 Exercise 6
;; What happens when Alyssa attempts to use this to compute square roots?
;; Explain.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (abs x) 
  (if (< x 0)
      (- x)
      x))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9.0)

;; The new program fails with an error of "maximum recursion depth
;; exceeded". This means that the new-if was never accepting a
;; good-enough root, because the else-clause of a cond is guranteed to be
;; constant.