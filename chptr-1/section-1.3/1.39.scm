(load "chptr-1/section-1.3/1.37.scm")
(load "common.scm")

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (square x))))
             (lambda (i) (- (* i 2.0) 1))
             k))