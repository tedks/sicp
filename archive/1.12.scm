;; The following pattern of numbers is called Pascal's Triangle: <sequence>
;; The numbers at the edge of the triangle are all 1, and each number 
;; inside the triangle is the sum of the two numbers above it. Write a
;; procedure that computes elements of Pascal's Triangle by means of a
;; recursive process.

;; n is the level in the triangle
;; m is the position
;; the value is therefore [n-1][m+1] + [n-1][m]
(define (pas n m)
  (cond
   ((< n m) 'error) ;; error!
   ((= m 0) 1) ;; left edge
   ((= n m) 1) ;; right edge
   (else (+ 
	  (pas (- n 1) m) ;; just above
	  (pas (- n 1) (- m 1)) ;; one over
	  ))))
(pas 500 100)

;;;     1      n = 0
;;;    1 1     n = 1
;;;   1 2 1    n = 2
;;;  1 3 3 1   n = 3
;;; 1 4 6 4 1  n = 4
