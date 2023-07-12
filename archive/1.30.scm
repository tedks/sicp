;;SICP 2nd Edition Chapter 1 Exercise 29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a)
	      (+ result (term a)))))
  (iter a 0))

(define (cube x) ( * x x x))
(define (inc x) (+ x 1))

(sum-iter cube 1 inc 10)
(sum cube 1 inc 10)

