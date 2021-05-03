;;; A stack overflow link that help me understand the Miller-Rabin test
;;; https://stackoverflow.com/questions/3733384/confused-on-miller-rabin
;;; Put simply, a non-trival square root of 1 modulo n
;;; is a number that its square modulo n = 1 modulo n
;;; i.e a^2

(define (non-trivial-sqrt? a m n)
  (if (or (= a 1) (= a (- n 1)))
      false
      (= (remainder (square a) n) 
         (remainder m n))))

;;; [REVISIT]
(define (expmod-miller base exp m)
  (cond ((= exp 0) 1)
        ((non-trivial-sqrt? base 1 m) 0)
        ((even? exp)
         (remainder
          (square (expmod-miller base (/ exp 2) m))
          m))
  (else
   (remainder
    (* base (expmod-miller base (- exp 1) m))
    m))))

(define (miller-rabin n)
  (define (try-it a)
    (= (expmod-miller a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin n) (fast-prime? n (- times 1)))
        (else false)))

;;; test-miller-prime returns false for carmicheal numbers listed in the book

(define (test-miller-prime? n)
  (define (iter a)
    (cond ((= a n) #t)
          ((not (= (expmod-miller a (- n 1) n) 1)) #f)
          (else (iter (+ a 1)))))
  (iter 1))