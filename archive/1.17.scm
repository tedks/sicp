;; SICP Chapter 1 Exercise 17 THe exponentiation algorithms in this
;; section are based on performing exponentiation by means of repeated
;; multiplication. In a similar way, one can perform integer
;; multiplication by means of repeated addition. The following
;; multiplication procedure (in which it is assumed that our language
;; can only add, not multiply) is analogous to the expt procedure:

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))

;; This algorithm takes a number of steps that is linear in b. Now
;; suppose we include, together with addition, operations 'double',
;; which doubles an integer, and 'halve', which divides an even
;; integer by two. Using these, design a multiplication procedure
;; ananalogous to fast-expt that uses a logarithmic number of steps.

(define (mul-log a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (cond
   ((= b 0) 0)
   ((even? b) (mul-log (double a) (halve b)))
   (else (+ a (mul-log a (- b 1))))
))

(define test 8)
(mul 2 test)
(mul-log 2 test)
