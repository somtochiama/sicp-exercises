;;; recursive
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))
            

(define (f2 n)
  (define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 (- n 2))))

;;; compact form of iterative procedure
(define (f3 n)
  (define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (f-iter 0 1 2 n))