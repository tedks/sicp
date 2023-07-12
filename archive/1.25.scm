;; primality testing routines

;; scanning for divisors

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;; fermat test

(define (expmod base exp m)
  (cond ((= expr 0) 1)
	((even? expr)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

;; 1.25
(define (expmod-new base exp m)
  (remainder (fast-expt base exp) m))
;; this procedure seems to work just as well as the old expmod. I
;; haven't tested it throughly, but it appears to be a functioning
;; combination of abstractions.



(define (fermat-test n)
  (define (try-it a)
    (= (expmod-new a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))



;; 1.22.scm
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      ))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  true)


(define (search-for-primes a b)
  ((cond
    ((> a b) 0)
    ((prime? b) 


;(search-for-primes 1000 10000)
