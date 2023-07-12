;;SICP 2nd Edition Chapter 1 Exercise 32

;; recursive accumulater
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

;;iterate accumulater
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

;;abstracted sum
(define (sum term a next b)
  (accumulate + 0 term a next b))

;;abstracted product
(define (product term a next b)
  (accumulate * 1 term a next 

(define (factorial n)
  (define (fact-term n) n)
  (define (fact-next n) (+ n 1))
  (product fact-term 1 fact-next n))

(factorial 3)

       