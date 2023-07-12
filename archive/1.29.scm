;;SICP 2nd Edition Chapter 1 Exercise 29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson-inter f a b n)
  (define (simp-h)
    (/ (/ (- b a) n) 3))
  (define (simp-y k)
    (f ((+ a (* (simp-h) k)))))
  (define (simp-term n)
    (* (if (even? n)
	2
	4) (simp-y n)))
  (define (inc n) (+ n 1))
  (* (/ (simp-h) 3)
     (+ (simp-y 0) (simp-y n) (sum simp-term 0 simp-next (- n 1)))))

