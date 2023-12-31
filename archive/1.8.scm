;; SICP 2nd Edition Chapter 1 Exercise 8
;; Newton's method for cube roots is based on the fact that if y is an
;; approximation to the cube root of x, then a better approximation is
;; given by the value
;; (x/(y^2) + 2y) / 3

;; Use this formula to implement a cube-root procedure analogous to the
;; square-root procedure. (In section 1.3.4 we will see how to implement
;; Newton's method in general as an abstraction of these square-root and
;; cube-root procedures.)



(define (abs x) 
  (if (< x 0.0)
      (- x)
      x))
      
(define (square x) (* x x))

(define (cube x) (* (square x) x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess x)
  (< (abs (/ (- (cube guess) x) x)) .001))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 27.0)

