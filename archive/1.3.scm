;;;SICP Chapter 1 Exercise 3
;;;Define a procedure that takes three numbers as arguments
;;;and returns the sum of the squares of the two larger numbers.


(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))


;;;(max a b), used as convienience: evaluates to a or 
;;;b, whatever is the maximum

(define (max a b)
  (if (> a b) a b))


(define (sum-of-max a b c)
  (cond
   ((and (> a b) (> a c))
    (sum-of-squares a (max b c)))
   ((and (> b a)(> b c))
    (sum-of-squares b (max a c)))
   ((and (> c a)(> c b))
    (sum-of-squares c (max b a)))
   ))


