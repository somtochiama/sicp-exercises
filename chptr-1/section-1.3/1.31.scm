; a
(define (inc x) (+ x 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (factorial n)
  (define (identity x) x)
  (product-iter identity 1 inc n))

(define (pi)
  (define (pi-term x)
    (if (even? x) 
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (* 4.0
     (product pi-term 1 inc 100)))

; b
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
