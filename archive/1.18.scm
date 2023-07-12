;; SICP Chapter 1 Exercise 18
;; Using the results of exercises 1.16 and 1.17, devise a procedure
;; that generates an iterative process for multiplying two integers in
;; terms of adding, doubling, and halving and uses a logarithmic
;; number of steps.

(define (mul-iter n a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (cond
   ((= b 0) n)
   ((even? b) (mul-iter n (double a) (halve b)))
   (else (mul-iter (+ n a) a (- b 1)))))

(mul-iter 0 2 5)