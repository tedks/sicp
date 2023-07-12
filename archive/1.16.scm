;; SICP Chapter 1 Exercise 16
;; Design a procedure that evolves an iterative exponentiation process
;; that uses successive squaring and uses a logarithmic number of
;; steps, as does 'fast-expt'. (Hint: Using the observation that
;; (b^n/2)^2 = (b^2)^n/2, keep, along with the exponent n and base b,
;; and additional state variable a, and define the state
;; transformation in such a way that the product ab^n is unchanged
;; from state to state. At the beginning of the process a is taken to
;; be 1, and the asnwer is given by the value of a at the end of the
;; process. In general, the technique of defining an 'invarian
;; quantity' that remains unchanged is a powerful way to think about
;; the design of iterative algorithms.

;; here is the recursive process:

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

;; for the iterative procedure, we need to store the result in a, and
;; count up from a=1

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
	((even? n) (fast-expt-iter a (square b) (/ n 2)))
	(else (fast-expt-iter (* a b) b (- n 1)))))


(define test 200000)
(fast-expt 2 test)
(fast-expt-iter 1 2 test)
	  