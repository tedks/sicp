;; SICP 2nd Edition Chapter 1 Exercise 31 

;;Write a procedure analogous to sum 'product', then define 'factorial
;;in terms of product. 

(define (product a term next b)
  (if (> a b)
      1
      (* (term a) (product (next a) term next b))))

(define (factorial n)
  (define (fact-term n) n)
  (define (fact-next n) (+ n 1))
  (product 1 fact-term fact-next n))

(* 3 2 1)
(factorial 3)

;; Also use 'product' to compute aproximations to pi using the formula:

;;pi/4 = (2*4*4*6*6*8...)/(3*3*5*5*7*7...)

(define (get-pi)
  (define (pi-next x) (+ x 2))
  (define (pi-term x) (* x 2))
  (* 4.0
  (/ (* 2.0 (product 4.0 pi-term pi-next 10.0)) 
     (product 3.0 pi-term pi-next 10.0))))

;; If your 'product' procedure generates a recursive process, write
;; one that generates an iterative process. If your 'product'
;; procedure generates an iterative process, write one that generates
;; a recursive process.

(define (product-iter a term next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a)
	      (* result (term a)))
	))
    (iter a 1))

(define (factorial-iter n)
  (define (fact-term x) x)
  (define (fact-next x) (+ x 1))
  (product-iter 1 fact-term fact-next n))

(factorial 3)
(factorial-iter 3)
(get-pi)