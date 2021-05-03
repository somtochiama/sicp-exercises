(load "chptr-1/section-1.2/fast-prime.scm")

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (test-prime? n)
  (define (iter a)
    (cond ((= a n) #t)
          ((not (= (expmod a n n) a)) #f)
          (else (iter (+ a 1)))))
  (iter 1))


;;; returns true for these carmicheal numbers too
;;; (test-prime? 561)
;;; (test-prime? 1105)
;;; (test-prime? 1729)