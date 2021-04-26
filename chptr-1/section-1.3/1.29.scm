(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc x) (+ x 1))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (term x)
    (cond ((or (= x 0) (= x n)) (f (+ a (* x h))))
          ((even? x) (* 2 (f (+ a (* x h)))))
          (else (* 4 (f (+ a (* x h)))))))
  (* (/ h 3.0) 
     (sum term 0 inc n)))

; This integral functions gives more accurate value
; (integral cube 0 1 100) => 0.25
; (integral cube 0 1 100) => 0.25